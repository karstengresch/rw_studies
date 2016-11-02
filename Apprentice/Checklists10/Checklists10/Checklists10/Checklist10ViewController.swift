//
//  ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 17.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

class Checklist10ViewController: UITableViewController {
  
  var checklist10Items: [Checklist10Item]
  
  
  required init?(coder aDecoder: NSCoder) {
    checklist10Items = [Checklist10Item]()
    
    let row0item = Checklist10Item()
    row0item.text = "Walk the dog"
    row0item.checked = false
    checklist10Items.append(row0item)
    let row1item = Checklist10Item()
    row1item.text = "Brush my teeth"
    row1item.checked = true
    checklist10Items.append(row1item)
    let row2item = Checklist10Item()
    row2item.text = "Learn iOS development"
    row2item.checked = true
    checklist10Items.append(row2item)
    let row3item = Checklist10Item()
    row3item.text = "Soccer practice"
    row3item.checked = false
    checklist10Items.append(row3item)
    let row4item = Checklist10Item()
    row4item.text = "Eat ice cream"
    row4item.checked = true
    checklist10Items.append(row4item)
    
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
  
  // MARK: TV Data Source related
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return checklist10Items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    print("cellForRowAt indexPath: \(indexPath )")
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

    let checklist10Item = checklist10Items[indexPath.row]
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = checklist10Item.text
    
    configureCheckmark(for: cell, at: indexPath)
    
    return cell
  }
  
  // MARK: TV delegate related
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("didSelectRowAt indexPath: \(indexPath )")
    
    if let cell = tableView.cellForRow(at: indexPath) {
      let checklist10Item = checklist10Items[indexPath.row]
      checklist10Item.checked = !checklist10Item.checked
      configureCheckmark(for: cell, )
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // MARK Individual methods
  
  func configureCheckmark(for cell: UITableViewCell, with checklist10Item: Checklist10Item) {
    
    print("configureCheckmark cell: \(cell) checklist10Item: \(checklist10Item)")

    if checklist10Item.checked {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }
  
  

}

