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
  
  @IBOutlet weak var addItemTextField: UITextField?
  @IBOutlet weak var doneBarButton: UIBarButtonItem?
  
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
    }
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
      delegate?.itemDetailViewController(self, didFinishEditingItem: checklistItem)
    } else {
      
      let checklistItem = ChecklistItem()
      checklistItem.text = (addItemTextField?.text)!
      checklistItem.checked = false
      
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
  
  
}