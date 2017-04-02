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

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  weak var delegate: ListDetailViewControllerDelegate?
  
  var checklist10ToEdit: Checklist10?
  
}
