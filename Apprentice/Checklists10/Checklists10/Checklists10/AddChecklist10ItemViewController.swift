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
  
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  
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
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text! as NSString
    let newText = oldText.replacingCharacters(in: range, with: string)
    
    if newText.characters.count > 0 {
      doneBarButton.isEnabled = true
    } else {
      doneBarButton.isEnabled = false
    }
    
    return true
    
  }
  
}
