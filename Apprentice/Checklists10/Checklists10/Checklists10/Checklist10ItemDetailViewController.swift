//
//  Checklist10ItemDetailViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 20.11.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation
import UIKit

protocol Checklist10ItemDetailViewControllerDelegate: class {
  func checklist10ItemDetailViewControllerDidCancel(_ controller: Checklist10ItemDetailViewController)
  func checklist10ItemDetailViewController(_ controller: Checklist10ItemDetailViewController, didFinishAdding checklist10Item: Checklist10Item)
  func checklist10ItemDetailViewController(_ controller: Checklist10ItemDetailViewController, didFinishEditing checklist10Item: Checklist10Item)
}

class Checklist10ItemDetailViewController: UITableViewController, UITextFieldDelegate {
  
  // MARK: IBOutlet/IBAction
  
  @IBOutlet weak var addChecklist10ItemTextField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  @IBOutlet weak var shouldRemindSwitch: UISwitch!
  @IBOutlet weak var dueDateLabel: UILabel!
  
  @IBOutlet weak var datePickerCell: UITableViewCell!
  @IBOutlet weak var datePicker: UIDatePicker!

  @IBAction func dateChanged(_ datePicker: UIDatePicker) {
    dueDate = datePicker.date
    updateDueDateLabel()
  }
  
  weak var delegate: Checklist10ItemDetailViewControllerDelegate?
  
  var checklist10ItemToEdit: Checklist10Item?
  var dueDate = Date()
  var isDatePickerVisible = false
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let checklist10Item = checklist10ItemToEdit {
      title = "Edit Checklist10 Item"
      addChecklist10ItemTextField.text = checklist10Item.text
      doneBarButton.isEnabled = true
      shouldRemindSwitch.isOn = checklist10Item.shouldRemind
      dueDate = checklist10Item.dueDate
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    addChecklist10ItemTextField.becomeFirstResponder()
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    addChecklist10ItemTextField.becomeFirstResponder()
    
  }
  
  @IBAction func cancel() {
    // dismiss(animated: true, completion: nil)
    print("CANCEL Contents of addChecklist10ItemTextField: \(addChecklist10ItemTextField.text ?? "N/V")")
    delegate?.checklist10ItemDetailViewControllerDidCancel(self)
  }
  
  @IBAction func done() {
    print("DONE Contents of addChecklist10ItemTextField: \(addChecklist10ItemTextField.text ?? "N/V")")
    // dismiss(animated: true, completion: nil)
    
    if let checklist10Item = checklist10ItemToEdit {
      checklist10Item.text = addChecklist10ItemTextField.text!
      checklist10Item.shouldRemind = shouldRemindSwitch.isOn
      checklist10Item.dueDate = dueDate
      
      delegate?.checklist10ItemDetailViewController(self, didFinishEditing: checklist10Item)
    }
    else {
      let checklist10Item = Checklist10Item()
      checklist10Item.text = addChecklist10ItemTextField.text!
      checklist10Item.checked = false

      checklist10Item.shouldRemind = shouldRemindSwitch.isOn
      checklist10Item.dueDate = dueDate

      delegate?.checklist10ItemDetailViewController(self, didFinishAdding: checklist10Item)
    }
  }
  
  // MARK: TVC methods
  
  // disallow row from selection
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    if indexPath.section == 1 && indexPath.row == 1 {
      return indexPath
    } else {
      return nil
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 1 && isDatePickerVisible {
      return 3
    } else {
      return super.tableView(tableView, numberOfRowsInSection: section)
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 1 && indexPath.row == 2 {
      return 217
    } else {
      return super.tableView(tableView, heightForRowAt: indexPath)
    }
  }
  
  override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
    var newIndexPath = indexPath
    
    if indexPath.section == 1 && indexPath.row == 2 {
      newIndexPath = IndexPath(row: 0, section: indexPath.section)
    }
    
    return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    addChecklist10ItemTextField.resignFirstResponder()
    
    if indexPath.section == 1 && indexPath.row == 1 {
      showDatePicker()
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 1 && indexPath.row == 2 {
      return datePickerCell
    } else {
      return super.tableView(tableView, cellForRowAt: indexPath)
    }
  }
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text! as NSString
    let newText = oldText.replacingCharacters(in: range, with: string) as NSString
    
    /*
    if newText.characters.count > 0 {
      doneBarButton.isEnabled = true
    } else {
      doneBarButton.isEnabled = false
    }
    */
    
    doneBarButton.isEnabled = (newText.length > 0)
    return true
  }
  
  func updateDueDateLabel() {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    dueDateLabel.text = formatter.string(from: dueDate)
  }
  
  func showDatePicker() {
    print("Calling: showDatePicker()")
    isDatePickerVisible = true
    let indexPathDatePicker = IndexPath(row: 2, section: 1)
    tableView.insertRows(at: [indexPathDatePicker], with: .fade)
  }
  
}
