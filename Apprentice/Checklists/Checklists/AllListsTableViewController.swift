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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("Numbers of rows: \(dataModel.checklists.count)")
    return dataModel.checklists.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    print("indexPath.row: \(indexPath.row)" )
    let cell = cellForTableView(tableView)
    
    let checklist = dataModel.checklists[(indexPath as NSIndexPath).row]
    cell.textLabel?.text = checklist.name
    cell.accessoryType = .detailDisclosureButton
    
    let count = checklist.countUncheckedItems()
    
    if checklist.checklistItems.count == 0 {
      cell.detailTextLabel?.text = "Start entering new items!"
    }
    else if count == 0 {
      cell.detailTextLabel?.text = "All done!"
    } else {
     cell.detailTextLabel?.text = "\(count) Remaining"
    }
    
    cell.imageView?.image = UIImage(named: checklist.iconName)
    return cell
  }
  
  
  func cellForTableView(_ tableView: UITableView) -> UITableViewCell {
    let cellIdentifier = "AddChecklistCell"
    var returnCell: UITableViewCell?
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
      returnCell = cell
    } else {
      returnCell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
    }
    
    return returnCell!
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("indexPath.row: \((indexPath as NSIndexPath).row)" )
    dataModel.indexOfSelectedChecklist = (indexPath as NSIndexPath).row
    let checklist = dataModel.checklists[(indexPath as NSIndexPath).row]
    performSegue(withIdentifier: "ShowChecklist", sender: checklist)
  }
  
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    dataModel.checklists.remove(at: (indexPath as NSIndexPath).row)
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
  }
  
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    let navigationController = storyboard!.instantiateViewController(withIdentifier: "ListDetailViewC≤ontroller") as! UINavigationController
    let controller = navigationController.topViewController as! ListDetailViewController
    controller.delegate = self
    
    let checklist = dataModel.checklists[(indexPath as NSIndexPath).row]
    controller.checklistToEdit = checklist
    present(navigationController, animated: true, completion: nil)
    
  }
  
    // MARK: ListDetailViewController delegate methods
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
     dismiss(animated: true, completion: nil)
    }
    
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist) {
      print("didFinishAddingItem - checklist name: \(checklist.name)")
      dataModel.checklists.append(checklist)
      dataModel.sortChecklists()
      tableView.reloadData()
      dismiss(animated: true, completion: nil)
    }
    
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist) {
      print("didFinishEditingItem - checklist name: \(checklist.name)")
      dataModel.sortChecklists()
      tableView.reloadData()
      dismiss(animated: true, completion: nil)
      
    }
  
  // MARK: Navigation
  func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    if viewController === self {
      dataModel.indexOfSelectedChecklist = -1
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowChecklist" {
      let controller = segue.destination as! ChecklistViewController
      controller.checklist = sender as! Checklist
    } else if segue.identifier == "AddChecklist" {
      let navigationController = segue.destination as! UINavigationController
      let controller = navigationController.topViewController as! ListDetailViewController
      controller.delegate = self
      controller.checklistToEdit = nil
      
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.delegate = self
    let index = dataModel.indexOfSelectedChecklist
    
    if index > 0 && index < dataModel.checklists.count {
      let checklist = dataModel.checklists[index]
      performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
  }
  
}
