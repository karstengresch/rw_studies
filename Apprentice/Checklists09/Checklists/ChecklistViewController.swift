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
  
  func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
    dismiss(animated: true, completion: nil)
  }
  
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAddingItem checklistItem: ChecklistItem) {
    let newRowIndex = checklist.checklistItems.count
    
    checklist.checklistItems.append(checklistItem)
    
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    
    tableView.insertRows(at: indexPaths, with: .automatic)
    
    dismiss(animated: true, completion: nil)
  }
  
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditingItem checklistItem: ChecklistItem) {
    
    if let index = checklist.checklistItems.index(of: checklistItem) {
      let indexPath = IndexPath(row: index, section: 0)
      
      if let cell = tableView.cellForRow(at: indexPath) {
        configureTextForCell(cell, withChecklistItem: checklistItem)
      }
    }
    dismiss(animated: true, completion: nil)
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
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddCheckListItem" {
      print("AddCheckListItem segue called")
      let navigationController = segue.destination as? UINavigationController
      let controller = navigationController?.topViewController as? ItemDetailViewController
      
      controller?.delegate = self
    }
    
    if segue.identifier == "EditCheckListItem" {
      let navigationController = segue.destination as? UINavigationController
      let controller = navigationController?.topViewController as? ItemDetailViewController
      
      controller?.delegate = self
      
      if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
        controller?.checklistItemToEdit = checklist.checklistItems[(indexPath as NSIndexPath).row]
      }
    }
    
  }
  
  // MARK: Content related methods
  func configureCheckmarkForCell(_ cell: UITableViewCell, withChecklistItem checklistItem: ChecklistItem) {
    
    let label = cell.viewWithTag(1001) as? UILabel
    label?.textColor = view.tintColor
    
    if checklistItem.checked {
      label?.text = "√"
    } else {
      label?.text = ""
    }
  }
  
  func configureTextForCell(_ cell: UITableViewCell, withChecklistItem checklistItem: ChecklistItem) {
    let label = cell.viewWithTag(1000) as? UILabel
    // label?.text =  checklistItem.text
    label?.text = "\(checklistItem.itemId) : \(checklistItem.text)"
  }
  
  // MARK: Data Source methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return checklist.checklistItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    let checklistItem = checklist.checklistItems[(indexPath as NSIndexPath).row]

    configureTextForCell(cell, withChecklistItem: checklistItem)
    configureCheckmarkForCell(cell, withChecklistItem: checklistItem)
    
    return cell
  }
  
  
    // MARK: Table delegate methods
  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
       let checklistItem = checklist.checklistItems[(indexPath as NSIndexPath).row]
   checklistItem.toggleChecked()
   configureCheckmarkForCell(cell, withChecklistItem: checklistItem)
      
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    checklist.checklistItems.remove(at: (indexPath as NSIndexPath).row)
    
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
  }

}

