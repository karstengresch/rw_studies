//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 02.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  
  
  @IBOutlet weak var addItemTextField: UITextField?
  @IBOutlet weak var doneBarButton: UIBarButtonItem?
  
  // MARK: View related
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    addItemTextField?.becomeFirstResponder()
  }
  
  
  // MARK: Table specific
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
  
  // MARK: Action handlers
  @IBAction func cancel() {
   dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  @IBAction func done() {
    print("Contents of the text field: \(addItemTextField?.text) ")
    dismissViewControllerAnimated(true, completion: nil)
  }
  
}