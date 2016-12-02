//
//  AddChecklist10ItemViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 20.11.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation

import UIKit

protocol AddChecklist10ItemViewControllerDelegate: class {
  func addChecklist10ItemViewControllerDidCancel(_ controller: AddChecklist10ItemViewController)
  func addChecklist10ItemViewController(_ controller: AddChecklist10ItemViewController, didFinishingAdding checklist10Item: Checklist10Item)
}

class AddChecklist10ItemViewController: UITableViewController, UITextFieldDelegate {
  
  weak var delegate: AddChecklist10ItemViewControllerDelegate?
  
  // MARK: IBOutlet/IBAction
  
  @IBOutlet weak var addChecklist10ItemTextField: UITextField!
  
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  
  @IBAction func cancel() {
    // dismiss(animated: true, completion: nil)
    delegate?.addChecklist10ItemViewControllerDidCancel(self)
  }
  
  @IBAction func done() {
    print("Contents of addChecklist10ItemTextField: \(addChecklist10ItemTextField.text)")
    // dismiss(animated: true, completion: nil)
    
    let checklist10Item = Checklist10Item()
    checklist10Item.text = addChecklist10ItemTextField.text!
    checklist10Item.checked = false
    delegate?.addChecklist10ItemViewController(self, didFinishingAdding: checklist10Item)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddChecklist10Item" {
      let navigationController = segue.destination as! UINavigationController
      
      let controller = navigationController.topViewController as! AddChecklist10ItemViewController
      
      controller.delegate = self
    }
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
