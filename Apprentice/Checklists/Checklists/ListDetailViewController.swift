//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 15.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit


  protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(controller: ListDetailViewController)
    func listDetailViewController(controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist)
    func listDetailViewController(controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist)
  }
  
  class ListDetailViewController: UITableViewController, UITextFieldDelegate, IconPickerViewControllerDelegate {
    var checklistToEdit: Checklist?
    var iconName = "Folder"
    
    
    @IBOutlet weak var checklistTextField: UITextField?
    @IBOutlet weak var doneBarButton: UIBarButtonItem?
    @IBOutlet weak var iconImageView: UIImageView!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    // MARK: View related
    override func viewWillAppear(animated: Bool) {
      super.viewWillAppear(animated)
      checklistTextField?.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      if let itemToEdit = checklistToEdit {
        title = "Edit checklist"
        checklistTextField?.text = itemToEdit.name
        doneBarButton?.enabled = true
        iconName = itemToEdit.iconName
      }
      
      iconImageView.image = UIImage(named: iconName)
    }
    
    // MARK: Table specific
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
      if indexPath.section == 1 {
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
        delegate?.listDetailViewController(self, didFinishEditingChecklist: checklist)
      } else {
          if let name = checklistTextField?.text {
            let checklist = Checklist(name: name)
            delegate?.listDetailViewController(self, didFinishAddingChecklist: checklist)
        } else {
          let checklist = Checklist(name: "New checklist")
          delegate?.listDetailViewController(self, didFinishAddingChecklist: checklist)
        }
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
    
    // MARK: Segue related
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "PickIcon" {
        let controller = segue.destinationViewController as! IconPickerViewController
        controller.delegate = self
      }
    }
    
    // MARK: IconPicker related
    func iconPicker(picker: IconPickerViewController, didPickIcon iconName: String) {
      self.iconName = iconName
      iconImageView.image = UIImage(named: iconName)
      navigationController?.popViewControllerAnimated(true)
    }

}
