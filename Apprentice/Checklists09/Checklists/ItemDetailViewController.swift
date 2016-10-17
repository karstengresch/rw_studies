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
  func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAddingItem checklistItem: ChecklistItem)
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditingItem checklistItem: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
  var checklistItemToEdit: ChecklistItem?
  var dueDate = Date()
  var datePickerVisible = false
  
  
  @IBOutlet weak var addItemTextField: UITextField?
  @IBOutlet weak var doneBarButton: UIBarButtonItem?
  
  @IBOutlet weak var shouldRemindSwitch: UISwitch?
  @IBOutlet weak var dueDateLabel: UILabel?
  
  @IBOutlet weak var datePickerCell: UITableViewCell?
  @IBOutlet weak var datePicker: UIDatePicker?
  
  
  weak var delegate: ItemDetailViewControllerDelegate?
  
  // MARK: View related
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    addItemTextField?.becomeFirstResponder()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let itemToEdit = checklistItemToEdit {
      title = "Edit item"
      addItemTextField?.text = itemToEdit.text
      doneBarButton?.isEnabled = true
      shouldRemindSwitch?.isOn = itemToEdit.shouldRemind
      dueDate = itemToEdit.dueDate as Date
    }
    
    updateDueDateLabel()
    
  }

  func updateDueDateLabel() {
    print("updateDueDateLabel")
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    dueDateLabel?.text = formatter.string(from: dueDate)
  }
  
  
  // MARK: Table specific
  
  // MARK: Action handlers
  @IBAction func cancel() {
   // dismissViewControllerAnimated(true, completion: nil)
    delegate?.itemDetailViewControllerDidCancel(self);
    
  }
  
  @IBAction func done() {
    print("done()")

    if let checklistItem = checklistItemToEdit {
          print("done() - checklistItem exists")
      checklistItem.text = (addItemTextField?.text)!
      checklistItem.shouldRemind = (shouldRemindSwitch?.isOn)!
      checklistItem.dueDate = dueDate
      delegate?.itemDetailViewController(self, didFinishEditingItem: checklistItem)
      
    } else {
          print("done() - checklistItem does not exist")
      let checklistItem = ChecklistItem()
      checklistItem.text = (addItemTextField?.text)!
      checklistItem.checked = false
      checklistItem.shouldRemind = (shouldRemindSwitch?.isOn)!
      checklistItem.dueDate = dueDate
      delegate?.itemDetailViewController(self, didFinishAddingItem: checklistItem)
    }
    
  }
  
  // MARK: Text field specific
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if let oldText: NSString = textField.text as NSString? {
      let newText: NSString = oldText.replacingCharacters(in: range, with: string) as NSString
      
    doneBarButton?.isEnabled = (newText.length > 0)
      
    }
    
    return true

  }
  
  func showDatePicker() {
    print("showDatePicker()")
    datePickerVisible = true
    
    let indexPathDatePicker = IndexPath(row: 2, section: 1)
    
    tableView.insertRows(at: [indexPathDatePicker], with: .fade)
    
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("cellForRowAtIndexPath() indexPath.section: \((indexPath as NSIndexPath).section) - indexPath.row: \((indexPath as NSIndexPath).row)")
    if (indexPath as NSIndexPath).section == 1 && (indexPath as NSIndexPath).row == 2 {
      // dangerous
      return datePickerCell!
    } else {
      return super.tableView(tableView, cellForRowAt: indexPath)
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 1 && datePickerVisible {
      print("numberOfRowsInSection(): section 1 AND datePickerVisible")
      return 3
    } else {
      print("numberOfRowsInSection(): section 1 ?XOR datePickerVisible")
      return super.tableView(tableView, numberOfRowsInSection: section)
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if (indexPath as NSIndexPath).section == 1 && (indexPath as NSIndexPath).row == 2 {
      return 217
    } else {
      return super.tableView(tableView, heightForRowAt: indexPath)
    }
  }
  

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("didSelectRowAtIndexPath: \((indexPath as NSIndexPath).row) - didSelectRowAtIndexPath: \((indexPath as NSIndexPath).section)")
    tableView.deselectRow(at: indexPath, animated: true)
    addItemTextField?.resignFirstResponder()
    
    if (indexPath as NSIndexPath).section == 1 && (indexPath as NSIndexPath).row == 1 {
      print("Trying to show date picker")
      showDatePicker()
    }
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    if (indexPath as NSIndexPath).section == 1 && (indexPath as NSIndexPath).row == 1 {
      return indexPath
    } else {
      return nil
    }
  }
  
  override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
    var indexPath = indexPath

    if (indexPath as NSIndexPath).section == 1 && (indexPath as NSIndexPath).row == 2 {
      indexPath = IndexPath(row: 0, section: (indexPath as NSIndexPath).section)
    }
    
    return super.tableView(tableView, indentationLevelForRowAt: indexPath)
  
  }
  
}
