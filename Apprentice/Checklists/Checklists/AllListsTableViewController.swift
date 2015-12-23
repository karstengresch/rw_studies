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
    let cellIdentifier = "Cell"
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
  
}
