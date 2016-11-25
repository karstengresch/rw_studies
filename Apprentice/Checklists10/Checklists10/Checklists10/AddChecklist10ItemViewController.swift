//
//  AddChecklist10ItemViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 20.11.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation

import UIKit

class AddChecklist10ItemViewController: UITableViewController {
  
  
  // MARK: IBOutlet/IBAction
  
  @IBAction func cancel() {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func done() {
    dismiss(animated: true, completion: nil)
  }
  
  @IBOutlet weak var addCheclist10ItemTextField: UITextField!
  
  // MARK: TVC methods
  
  // disallow row from selection
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
  
}
