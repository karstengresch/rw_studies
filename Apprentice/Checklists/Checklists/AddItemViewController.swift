//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 02.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
  func addItemViewControllerDidCancel(controller: AddItemViewController)
  
  func addItemViewController(controller: AddItemViewController, didFinishAddingItem checklistItem: ChecklistItem)
  
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  var checklistItemToEdit: ChecklistItem?
  
  @IBOutlet weak var addItemTextField: UITextField?
  @IBOutlet weak var doneBarButton: UIBarButtonItem?
  
  weak var delegate: AddItemViewControllerDelegate?
  
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
    }
  }
  
  
  // MARK: Table specific
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
  
  // MARK: Action handlers
  @IBAction func cancel() {
   // dismissViewControllerAnimated(true, completion: nil)
    delegate?.addItemViewControllerDidCancel(self);
    
  }
  
  @IBAction func done() {
//    print("Contents of the text field: \(addItemTextField?.text) ")
//    dismissViewControllerAnimated(true, completion: nil)
    let checklistItem = ChecklistItem()
    checklistItem.text = (addItemTextField?.text)!
    checklistItem.checked = false
    
    delegate?.addItemViewController(self, didFinishAddingItem: checklistItem)
    
  }
  
  // MARK: Text field specific
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    
    if let oldText: NSString = textField.text {
      let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
      
    doneBarButton?.enabled = (newText.length > 0)
      
    }
    
    return true

    
  }
  
  
}