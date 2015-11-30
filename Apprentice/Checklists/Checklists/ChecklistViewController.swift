//
//  ViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 25.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  var row0item: ChecklistItem
  var row1item: ChecklistItem
  var row2item: ChecklistItem
  var row3item: ChecklistItem
  var row4item: ChecklistItem
  
  required init?(coder aDecoder: NSCoder) {
    row0item = ChecklistItem()
    row0item.text = "Walk the fish."
    row0item.checked = false

    row1item = ChecklistItem()
    row1item.text = "Massage my neck."
    row1item.checked = false
    
    row2item = ChecklistItem()
    row2item.text = "Learn singing."
    row2item.checked = false
    
    row3item = ChecklistItem()
    row3item.text = "ASMR practice."
    row3item.checked = false
    
    row4item = ChecklistItem()
    row4item.text = "Eat File Wellington."
    row4item.checked = false
    
    super.init(coder: aDecoder)
    
  }
  
  

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
      isChecked = row0item.checked
    case (1):
      isChecked = row1item.checked
    case (2):
      isChecked = row2item.checked
    case (3):
      isChecked = row3item.checked
    case (4):
      isChecked = row4item.checked
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
      label?.text = row0item.text
      
    case (1):
      label?.text = row1item.text
      
    case (2):
      label?.text = row2item.text
      
    case (3):
      label?.text = row3item.text
      
    case (4):
      label?.text = row4item.text
      
    default:
      label?.text = "Check the code."
    
    }
    
    configureCheckmarkForCell(cell, indexPath: indexPath)
    
    return cell
  }
  
  
    // MARK: Table delegate methods
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
      
      switch indexPath.row {
        
      case (0):
        row0item.checked = !row0item.checked
        
      case (1):
        row1item.checked = !row1item.checked

      case (2):
        row2item.checked = !row2item.checked
        
      case (3):
        row3item.checked = !row3item.checked
        
      case (4):
        row4item.checked = !row4item.checked
      default: break

      }
        configureCheckmarkForCell(cell, indexPath: indexPath)
      
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

}

