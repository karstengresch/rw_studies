//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 15.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit


  protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist)
  }
  
  class ListDetailViewController: UITableViewController, UITextFieldDelegate, IconPickerViewControllerDelegate {
    var checklistToEdit: Checklist?
    var iconName = "No Icon"
    
    
    @IBOutlet weak var checklistTextField: UITextField?
    @IBOutlet weak var doneBarButton: UIBarButtonItem?
    @IBOutlet weak var iconImageView: UIImageView!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    // MARK: View related
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      checklistTextField?.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      if let itemToEdit = checklistToEdit {
        title = "Edit checklist"
        checklistTextField?.text = itemToEdit.name
        doneBarButton?.isEnabled = true
        iconName = itemToEdit.iconName
        print("iconName: \(iconName)")
      }
      
      iconImageView.image = UIImage(named: iconName)
    }
    
    // MARK: Table specific
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      if (indexPath as NSIndexPath).section == 1 {
        return indexPath
      } else {
        return nil
      }
    }
    
    
    // MARK: Action handlers
    @IBAction func cancel() {
      // dismissViewControllerAnimated(true, completion: nil)
      delegate?.listDetailViewControllerDidCancel(self);
      
    }
    
    @IBAction func done() {
      if let checklist = checklistToEdit {
        checklist.name = (checklistTextField?.text)!
        checklist.iconName = iconName
        print("iconName: \(iconName)")
        delegate?.listDetailViewController(self, didFinishEditingChecklist: checklist)
      } else {
        let checklist = Checklist(name: (checklistTextField?.text)!, iconName: iconName)
        print("iconName: \(iconName)")
          delegate?.listDetailViewController(self, didFinishAddingChecklist: checklist)
      }
      
    }
    
    // MARK: Text field specific
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
      if let oldText: NSString = textField.text as NSString? {
        let newText: NSString = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton?.isEnabled = (newText.length > 0)
        
      }
      
      return true
    }
    
    // MARK: Segue related
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "PickIcon" {
        let controller = segue.destination as! IconPickerViewController
        controller.delegate = self
      }
    }
    
    // MARK: IconPicker related
    func iconPicker(_ picker: IconPickerViewController, didPickIcon iconName: String) {
      self.iconName = iconName
      iconImageView.image = UIImage(named: iconName)
      navigationController?.popViewController(animated: true)
    }

}
