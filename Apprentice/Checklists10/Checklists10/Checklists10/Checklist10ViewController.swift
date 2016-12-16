//
//  ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 17.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

class Checklist10ViewController: UITableViewController, AddChecklist10ItemViewControllerDelegate {
  
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
  
  // MARK: Delegate Implementations
  
  func addChecklist10ItemViewControllerDidCancel(_ controller: AddChecklist10ItemViewController) {
    dismiss(animated: true, completion: nil)
  }
  
  func addChecklist10ItemViewController(_ controller: AddChecklist10ItemViewController, didFinishingAdding checklist10Item: Checklist10Item) {
    let newRowIndex = checklist10Items.count
    checklist10Items.append(checklist10Item)
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
    dismiss(animated: true, completion: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddChecklist10Item" {
      let navigationController = segue.destination as! UINavigationController
      
      let controller = navigationController.topViewController as! AddChecklist10ItemViewController
      // TODO - broken: "Cannot assign value of type 'AddChecklist10ItemViewController' to type 'AddChecklist10ItemViewControllerDelegate?'"
      controller.delegate = self
    }
  }
  
  // MARK: IBAction and Outlet methods
  
  
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
    
    configureCheckmark(for: cell, with: checklist10Item)
    
    return cell
  }
  
  // MARK: TV delegate related
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("didSelectRowAt indexPath: \(indexPath )")
    
    if let cell = tableView.cellForRow(at: indexPath) {
      let checklist10Item = checklist10Items[indexPath.row]
      checklist10Item.checked = !checklist10Item.checked
      configureCheckmark(for: cell, with: checklist10Item)
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    checklist10Items.remove(at: indexPath.row)
    
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
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
  
  func configureText(for cell: UITableViewCell,
                     with checklist10Item: Checklist10Item) {
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = checklist10Item.text
  }

}

