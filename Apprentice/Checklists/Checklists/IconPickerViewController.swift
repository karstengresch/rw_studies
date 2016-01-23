//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 23.01.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
  func iconPicker(picker: IconPickerViewController, didPickIcon iconName: String)
}


class IconPickerViewController: UITableViewController {
  weak var delegate: IconPickerViewControllerDelegate?
  
}