//
//  AllListsTableViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 11.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController, ListDetailViewControllerDelegate, UINavigationControllerDelegate {
  var dataModel: DataModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("Numbers of rows: \(dataModel.checklists.count)")
    return dataModel.checklists.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    print("indexPath.row: \(indexPath.row)" )
    let cell = cellForTableView(tableView)
    
    let checklist = dataModel.checklists[indexPath.row]
    cell.textLabel?.text = checklist.name
    cell.accessoryType = .DetailDisclosureButton
    
    let count = checklist.countUncheckedItems()
    
    if checklist.checklistItems.count == 0 {
      cell.detailTextLabel?.text = "Start entering new items!"
    }
    else if count == 0 {
      cell.detailTextLabel?.text = "All done!"
    } else {
     cell.detailTextLabel?.text = "\(count) Remaining"
    }
    
    return cell
  }
  
  
  func cellForTableView(tableView: UITableView) -> UITableViewCell {
    let cellIdentifier = "AddChecklistCell"
    var returnCell: UITableViewCell?
    
    if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
      returnCell = cell
    } else {
      returnCell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
    }
    
    return returnCell!
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("indexPath.row: \(indexPath.row)" )
    dataModel.indexOfSelectedChecklist = indexPath.row
    let checklist = dataModel.checklists[indexPath.row]
    performSegueWithIdentifier("ShowChecklist", sender: checklist)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowChecklist" {
      let controller = segue.destinationViewController as! ChecklistViewController
      controller.checklist = sender as! Checklist
    } else if segue.identifier == "AddChecklist" {
      let navigationController = segue.destinationViewController as! UINavigationController
      let controller = navigationController.topViewController as! ListDetailViewController
      controller.delegate = self
      controller.checklistToEdit = nil
      
    }
  }
  
  
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    dataModel.checklists.removeAtIndex(indexPath.row)
    let indexPaths = [indexPath]
    tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
  }
  
  override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
    let navigationController = storyboard!.instantiateViewControllerWithIdentifier("ListDetailViewController") as! UINavigationController
    let controller = navigationController.topViewController as! ListDetailViewController
    controller.delegate = self
    
    let checklist = dataModel.checklists[indexPath.row]
    controller.checklistToEdit = checklist
    presentViewController(navigationController, animated: true, completion: nil)
    
  }
  
    // MARK: ListDetailViewController delegate methods
    func listDetailViewControllerDidCancel(controller: ListDetailViewController) {
     dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func listDetailViewController(controller: ListDetailViewController, didFinishAddingItem checklist: Checklist) {
      print("didFinishAddingItem - checklist name: \(checklist.name)")
      let newRowIndex = dataModel.checklists.count
      dataModel.checklists.append(checklist)
      
      let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
      let indexPaths = [indexPath]
      tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
      dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func listDetailViewController(controller: ListDetailViewController, didFinishEditingItem checklist: Checklist) {
      print("didFinishEditingItem - checklist name: \(checklist.name)")
      if let index = dataModel.checklists.indexOf(checklist) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        if let cell = tableView.cellForRowAtIndexPath(indexPath)
        {
            cell.textLabel?.text = checklist.name
        }
      }
      dismissViewControllerAnimated(true, completion: nil)
      
    }
  
  // MARK: Navigation Controller Delegate
  func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
    if viewController === self {
      dataModel.indexOfSelectedChecklist = -1
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.delegate = self
    let index = dataModel.indexOfSelectedChecklist
    
    if index > 0 && index < dataModel.checklists.count {
      let checklist = dataModel.checklists[index]
      performSegueWithIdentifier("ShowChecklist", sender: checklist)
      
      
    }
  }
  
}
