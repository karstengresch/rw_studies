//
//  ViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 25.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  var row0text = "Walk the bird."
  var row1text = "Brush your hair."
  var row2text = "Learn singing."
  var row3text = "Yoga practice."
  var row4text = "Eat Filet Wellington."
  
  var row0checked = false
  var row1checked = false
  var row2checked = false
  var row3checked = false
  var row4checked = false
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: Content related methods
  func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
    var isChecked = false
    
    switch indexPath.row {
    case (0):
      isChecked = row0checked
    case (1):
      isChecked = row1checked
    case (2):
      isChecked = row2checked
    case (3):
      isChecked = row3checked
    case (4):
      isChecked = row4checked
    default:
      isChecked = true
    }
    
    if isChecked {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
  }
  
  // MARK: Data Source methods
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
    let label = cell.viewWithTag(1000) as? UILabel
    
  switch indexPath.row % 5 {
  
    case (0):
      label?.text = row0text
      
    case (1):
      label?.text = row1text
      
    case (2):
      label?.text = row2text
      
    case (3):
      label?.text = row3text
      
    case (4):
      label?.text = row4text
      
    default:
      label?.text = "Check the code."
    
    }
    
    return cell
  }
  
  
    // MARK: Table delegate methods
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
      
      var isChecked = false
      
      switch indexPath.row {
        
      case (0):
        row0checked = !row0checked
        isChecked = row0checked
        
      case (1):
        row1checked = !row1checked
        isChecked = row1checked
        
      case (2):
        row2checked = !row2checked
        isChecked = row2checked
        
      case (3):
        row3checked = !row3checked
        isChecked = row3checked
        
      case (4):
        row4checked = !row4checked
        isChecked = row4checked
        
      default:
        isChecked = true
        
      }
      
      if (isChecked) {
        
        if cell.accessoryType == .None {
          cell.accessoryType = .Checkmark
        } else {
          cell.accessoryType = .None
        }
      }
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

}

