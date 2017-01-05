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
  func addItemViewController(_ controller: AddChecklist10ItemViewController, didFinishEditing checklist10Item: Checklist10Item)
}

class AddChecklist10ItemViewController: UITableViewController, UITextFieldDelegate {
  
  // MARK: IBOutlet/IBAction
  
  @IBOutlet weak var addChecklist10ItemTextField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!

  weak var delegate: AddChecklist10ItemViewControllerDelegate?
  
  var checklist10ItemToEdit: Checklist10Item?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let checklist10Item = checklist10ItemToEdit {
      title = "Edit checklist 10 item"
      addChecklist10ItemTextField.text = checklist10Item.text
      doneBarButton.isEnabled = true
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
    print("CANCEL Contents of addChecklist10ItemTextField: \(addChecklist10ItemTextField.text)")
    delegate?.addChecklist10ItemViewControllerDidCancel(self)
  }
  
  @IBAction func done() {
    print("DONE Contents of addChecklist10ItemTextField: \(addChecklist10ItemTextField.text)")
    // dismiss(animated: true, completion: nil)
    
    let checklist10Item = Checklist10Item()
    checklist10Item.text = addChecklist10ItemTextField.text!
    checklist10Item.checked = false
    delegate?.addChecklist10ItemViewController(self, didFinishingAdding: checklist10Item)
  }
  
  // MARK: TVC methods
  
  // disallow row from selection
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    /* if indexPath.section == 1 {
      return indexPath
    } else {
      return nil
    }*/
    
    return nil
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
  
}
