//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 23.01.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
  func iconPicker(_ picker: IconPickerViewController, didPickIcon iconName: String)
}


class IconPickerViewController: UITableViewController {
  weak var delegate: IconPickerViewControllerDelegate?
  
  let icons = [ "No Icon",
                "Appointments",
                "Birthdays",
                "Chores",
                "Drinks",
                "Folder",
                "Groceries",
                "Inbox",
                "Photos",
                "Trips" ]
  
  // MARK: table delegate methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return icons.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
    let iconName = icons[(indexPath as NSIndexPath).row]
    cell.textLabel?.text = iconName
    cell.imageView?.image = UIImage(named: iconName)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if let delegate = delegate {
        let iconName = icons[(indexPath as NSIndexPath).row]
        print("IPCV iconName: \(iconName)")
        delegate.iconPicker(self, didPickIcon: iconName)
      }
    }
  
}
