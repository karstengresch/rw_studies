//
//  ViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 25.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
  
  var checklist: Checklist!

  // MARK: Delegate protocol implementations
  
  func itemDetailViewControllerDidCancel(controller: ItemDetailViewController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem checklistItem: ChecklistItem) {
    let newRowIndex = checklist.checklistItems.count
    
    checklist.checklistItems.append(checklistItem)
    
    let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
    let indexPaths = [indexPath]
    
    tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem checklistItem: ChecklistItem) {
    
    if let index = checklist.checklistItems.indexOf(checklistItem) {
      let indexPath = NSIndexPath(forRow: index, inSection: 0)
      
      if let cell = tableView.cellForRowAtIndexPath(indexPath) {
        configureTextForCell(cell, withChecklistItem: checklistItem)
      }
    }
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  
  // MARK: General view related methods

  override func viewDidLoad() {
    super.viewDidLoad()
    title = checklist.name
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "AddCheckListItem" {
      let navigationController = segue.destinationViewController as? UINavigationController
      let controller = navigationController?.topViewController as? ItemDetailViewController
      
      controller?.delegate = self
    }
    
    if segue.identifier == "EditCheckListItem" {
      let navigationController = segue.destinationViewController as? UINavigationController
      let controller = navigationController?.topViewController as? ItemDetailViewController
      
      controller?.delegate = self
      
      if let indexPath = tableView.indexPathForCell((sender as? UITableViewCell)!) {
        controller?.checklistItemToEdit = checklist.checklistItems[indexPath.row]
      }
    }
    
  }
  
  // MARK: Content related methods
  func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem checklistItem: ChecklistItem) {
    
    let label = cell.viewWithTag(1001) as? UILabel
    
    if checklistItem.checked {
      label?.text = "√"
    } else {
      label?.text = ""
    }
  }
  
  func configureTextForCell(cell: UITableViewCell, withChecklistItem checklistItem: ChecklistItem) {
    let label = cell.viewWithTag(1000) as? UILabel
    label?.text =  checklistItem.text
  }
  
  // MARK: Data Source methods
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return checklist.checklistItems.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
    let checklistItem = checklist.checklistItems[indexPath.row]

    configureTextForCell(cell, withChecklistItem: checklistItem)
    configureCheckmarkForCell(cell, withChecklistItem: checklistItem)
    
    return cell
  }
  
  
    // MARK: Table delegate methods
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
       let checklistItem = checklist.checklistItems[indexPath.row]
   checklistItem.toggleChecked()
   configureCheckmarkForCell(cell, withChecklistItem: checklistItem)
      
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    checklist.checklistItems.removeAtIndex(indexPath.row)
    
    let indexPaths = [indexPath]
    tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
  }
  
  /*
  // MARK: File related
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("Checklist.plist")
  }
  
  func saveChecklistItems() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(checklist.checklistItems, forKey: "ChecklistItems")
    archiver.finishEncoding()
    data.writeToFile(dataFilePath(), atomically: true)
  }
  */
  
  /*
  func loadChecklistItems() {
  let path = dataFilePath()
  if NSFileManager.defaultManager().fileExistsAtPath(path) {
  if let data = NSData(contentsOfFile: path) {
  let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
  checklist.checklistItems = unarchiver.decodeObjectForKey("ChecklistItems") as! [ChecklistItem]
  unarchiver.finishDecoding()
  }
  }
  
  }
  */


}

