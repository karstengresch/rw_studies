//
//  ListDetailViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 02.04.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
  
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  weak var delegate: ListDetailViewControllerDelegate?
  
  var checklist10ToEdit: Checklist10?
  
}
