//
//  IconPicker10ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 25.04.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

protocol IconPicker10ViewControllerDelegate: class {
  func iconPicker10(_ picker: IconPicker10ViewController, didPick iconName: String)
}

class IconPicker10ViewController: UITableViewController {
  weak var delegate: IconPicker10ViewControllerDelegate?
  
  let icons = [
    "No Icon",
    "Appointments",
    "Birthdays",
    "Chores",
    "Drinks",
    "Folder",
    "Groceries",
    "Inbox",
    "Photos",
    "Trips" ]
}
