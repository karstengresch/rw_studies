//
//  AllListsTableViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 11.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController, ListDetailViewControllerDelegate {
  var checklists: [Checklist]
  
  required init?(coder aDecoder: NSCoder) {
    checklists = [Checklist]()
    
    super.init(coder: aDecoder)
    
    var checklist = Checklist(name: "Birthdays")
    checklists.append(checklist)
    
    checklist = Checklist(name: "True hackers")
    checklists.append(checklist)
    
    checklist = Checklist(name: "More Birthdays")
    checklists.append(checklist)
    
    checklist = Checklist(name: "Other Birthdays")
    checklists.append(checklist)
    
    checklist = Checklist(name: "Restaurants")
    checklists.append(checklist)
    
    
    
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("Numbers of rows: \(checklists.count)")
    return checklists.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    print("indexPath.row: \(indexPath.row)" )
    let cell = cellForTableView(tableView)
    
    let checklist = checklists[indexPath.row]
    cell.textLabel?.text = checklist.name
    cell.accessoryType = .DetailDisclosureButton
    
    return cell
  }
  
  
  func cellForTableView(tableView: UITableView) -> UITableViewCell {
    let cellIdentifier = "AddChecklistCell"
    var returnCell: UITableViewCell?
    
    if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
      returnCell = cell
    } else {
      returnCell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
    }
    
    return returnCell!
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("indexPath.row: \(indexPath.row)" )
    let checklist = checklists[indexPath.row]
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
    checklists.removeAtIndex(indexPath.row)
    let indexPaths = [indexPath]
    tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
  }
  
    // MARK: ListDetailViewController delegate methods
    func listDetailViewControllerDidCancel(controller: ListDetailViewController) {
     dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func listDetailViewController(controller: ListDetailViewController, didFinishAddingItem checklist: Checklist) {
      print("didFinishAddingItem - checklist name: \(checklist.name)")
      let newRowIndex = checklists.count
      checklists.append(checklist)
      
      let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
      let indexPaths = [indexPath]
      tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
      dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func listDetailViewController(controller: ListDetailViewController, didFinishEditingItem checklist: Checklist) {
      print("didFinishEditingItem - checklist name: \(checklist.name)")
      if let index = checklists.indexOf(checklist) {
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        if let cell = tableView.cellForRowAtIndexPath(indexPath)
        {
            cell.textLabel?.text = checklist.name
        }
      }
      dismissViewControllerAnimated(true, completion: nil)
      
    }
  
  
}
