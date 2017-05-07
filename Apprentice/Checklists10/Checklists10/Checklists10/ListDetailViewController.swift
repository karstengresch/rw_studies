//
//  ListDetailViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 02.04.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
  func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
  func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist10: Checklist10)
  func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist10: Checklist10)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate, IconPicker10ViewControllerDelegate {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  @IBOutlet weak var iconImageView: UIImageView!
  
  
  
  weak var delegate: ListDetailViewControllerDelegate?
  
  var checklist10ToEdit: Checklist10?
  var iconName = "Folder"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let checklist10 = checklist10ToEdit {
      title = "Edit Checklist10"
      textField.text = checklist10.name
      doneBarButton.isEnabled = true
      iconName = checklist10.iconName
    }
    
    iconImageView.image = UIImage(named: iconName)
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
  }
  
  // MARK: Table View Related
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    if indexPath.section == 1 {
      return indexPath
    } else {
      return nil
    }
  }
  
  
  // MARK: UI Related
  
  @IBAction func cancel() {
    delegate?.listDetailViewControllerDidCancel(self)
  }
  
  @IBAction func done() {
    print("ListDetailViewController: done")
    if let checklist10 = checklist10ToEdit {
      checklist10.name = textField.text!
      checklist10.iconName =  iconName
      delegate?.listDetailViewController(self, didFinishEditing: checklist10)
    } else {
        let checklist10 = Checklist10(name: textField.text!, iconName: iconName)
      delegate?.listDetailViewController(self, didFinishAdding: checklist10)
    }
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text! as NSString
    let newText = oldText.replacingCharacters(in: range, with: string) as NSString
    doneBarButton.isEnabled = (newText.length > 0)
    return true
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "PickListIcon" {
      let controller = segue.destination as! IconPicker10ViewController
      controller.delegate = self
    }
  }
  
  func iconPicker10(_ picker: IconPicker10ViewController, didPick iconName: String) {
    self.iconName = iconName
    iconImageView.image = UIImage(named: iconName)
    let _ = navigationController?.popViewController(animated: true)
  }
  
}
