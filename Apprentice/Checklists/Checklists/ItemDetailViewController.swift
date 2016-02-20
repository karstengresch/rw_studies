//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 02.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDetailViewControllerDelegate: class {
  func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
  func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem checklistItem: ChecklistItem)
  func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem checklistItem: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
  var checklistItemToEdit: ChecklistItem?
  var dueDate = NSDate()
  var datePickerVisible = false
  
  
  @IBOutlet weak var addItemTextField: UITextField?
  @IBOutlet weak var doneBarButton: UIBarButtonItem?
  
  @IBOutlet weak var shouldRemindSwitch: UISwitch?
  @IBOutlet weak var dueDateLabel: UILabel?
  
  @IBOutlet weak var datePickerCell: UITableViewCell?
  @IBOutlet weak var datePicker: UIDatePicker?
  
  
  weak var delegate: ItemDetailViewControllerDelegate?
  
  // MARK: View related
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    addItemTextField?.becomeFirstResponder()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let itemToEdit = checklistItemToEdit {
      title = "Edit item"
      addItemTextField?.text = itemToEdit.text
      doneBarButton?.enabled = true
      shouldRemindSwitch?.on = itemToEdit.shouldRemind
      dueDate = itemToEdit.dueDate
    }
    
    updateDueDateLabel()
    
  }

  func updateDueDateLabel() {
    let formatter = NSDateFormatter()
    formatter.dateStyle = .MediumStyle
    formatter.timeStyle = .ShortStyle
    dueDateLabel?.text = formatter.stringFromDate(dueDate)
  }
  
  
  // MARK: Table specific
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
  
  // MARK: Action handlers
  @IBAction func cancel() {
   // dismissViewControllerAnimated(true, completion: nil)
    delegate?.itemDetailViewControllerDidCancel(self);
    
  }
  
  @IBAction func done() {

    if let checklistItem = checklistItemToEdit {
      checklistItem.text = (addItemTextField?.text)!
      checklistItem.shouldRemind = (shouldRemindSwitch?.on)!
      checklistItem.dueDate = dueDate
      delegate?.itemDetailViewController(self, didFinishEditingItem: checklistItem)
      
    } else {
      
      let checklistItem = ChecklistItem()
      checklistItem.text = (addItemTextField?.text)!
      checklistItem.checked = false
      checklistItem.shouldRemind = (shouldRemindSwitch?.on)!
      checklistItem.dueDate = dueDate
      delegate?.itemDetailViewController(self, didFinishAddingItem: checklistItem)
    }
    
  }
  
  // MARK: Text field specific
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    
    if let oldText: NSString = textField.text {
      let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
      
    doneBarButton?.enabled = (newText.length > 0)
      
    }
    
    return true

  }
  
  func showDatePicker() {
    datePickerVisible = true
    
    let indexPathDatePicker = NSIndexPath(forRow: 2, inSection: 1)
    
    tableView.insertRowsAtIndexPaths([indexPathDatePicker], withRowAnimation: .Fade)
    
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if indexPath.section == 1 && indexPath.row == 2 {
      // dangerous
      return datePickerCell!
    } else {
      return super.tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 1 && datePickerVisible {
      return 3
    } else {
      return super.tableView(tableView, numberOfRowsInSection: section)
    }
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if indexPath.section == 1 && indexPath.row == 2 {
      return 217
    } else {
      return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("didSelectRowAtIndexPath: \(indexPath.row)")
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    addItemTextField?.resignFirstResponder()
    
    if indexPath.section == 1 && indexPath.row == 1 {
      print("Trying to show date picker")
      showDatePicker()
    }
  }
  
  }
  
