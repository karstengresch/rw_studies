//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 02.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController {
  
  
  
  // MARK: Table specific
  override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
  }
  
  
  // MARK: Action handlers
  @IBAction func cancel() {
   dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  @IBAction func done() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
}