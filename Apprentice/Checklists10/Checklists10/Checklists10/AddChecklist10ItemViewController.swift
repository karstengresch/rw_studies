//
//  AddChecklist10ItemViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 20.11.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation

import UIKit

class AddChecklist10ItemViewController: UITableViewController, UITextFieldDelegate {
  
  
  // MARK: IBOutlet/IBAction
  
  @IBOutlet weak var addChecklist10ItemTextField: UITextField!
  
  @IBAction func cancel() {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func done() {
    print("Contents of addChecklist10ItemTextField: \(addChecklist10ItemTextField.text)")
    dismiss(animated: true, completion: nil)
  }
  
  
  
  // MARK: TVC methods
  
  // disallow row from selection
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    addChecklist10ItemTextField.becomeFirstResponder()
  }
  
}
