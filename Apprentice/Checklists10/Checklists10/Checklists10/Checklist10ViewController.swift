//
//  ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 17.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

class Checklist10ViewController: UITableViewController, Checklist10ItemDetailViewControllerDelegate {
  
  var checklist10: Checklist10?

  /*
  required init?(coder aDecoder: NSCoder) {
    checklist10?.checklist10Items = [Checklist10Item]()
    super.init(coder: aDecoder)
    // print("Documents folder is \(documentsDirectory())")
    // print("Data file path is \(dataFilePath())")
    // loadChecklist10Items()
  }
  */

  override func viewDidLoad() {
    super.viewDidLoad()
    if let checklist10Init = checklist10 {
      title = checklist10Init.name
    }
  }
  
  /*
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
    dataModel10.saveChecklist10s()
  }
  */
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: Delegate Implementation
  
  // MARK: IBAction and Outlet methods
  
  
  // MARK: TV Data Source related
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (checklist10?.checklist10Items.count)!
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    print("cellForRowAt indexPath: \(indexPath )")
    
    // from prototype cell
    let cell = tableView.dequeueReusableCell(withIdentifier: "Checklist10Item", for: indexPath)

    let checklist10Item = checklist10?.checklist10Items[indexPath.row]
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = checklist10Item?.text
    
    configureCheckmark(for: cell, with: checklist10Item!)
    
    return cell
  }
  
  // MARK: TV delegate related
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("didSelectRowAt indexPath: \(indexPath )")
    
    if let cell = tableView.cellForRow(at: indexPath) {
      let checklist10Item = checklist10?.checklist10Items[indexPath.row]
      checklist10Item?.toggleChecked()
      configureCheckmark(for: cell, with: checklist10Item!)
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
    // saveChecklist10Items()
  }
  

  
  // MARK Individual methods
  
  func configureCheckmark(for cell: UITableViewCell, with checklist10Item: Checklist10Item) {
    
    print("configureCheckmark cell: \(cell) checklist10Item: \(checklist10Item)")
    
    let label = cell.viewWithTag(1001) as! UILabel

    if checklist10Item.checked {
      label.text = "√"
    } else {
      label.text = ""
    }
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    checklist10?.checklist10Items.remove(at: indexPath.row)
    
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
    // saveChecklist10Items()
  }
  
  func configureText(for cell: UITableViewCell,
                     with checklist10Item: Checklist10Item) {
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = checklist10Item.text
  }

  
  func checklist10ItemDetailViewControllerDidCancel(_ controller: Checklist10ItemDetailViewController) -> () {
    dismiss(animated: true, completion: nil)
  }
  
  func checklist10ItemDetailViewController(_ controller: Checklist10ItemDetailViewController, didFinishAdding checklist10Item: Checklist10Item) -> () {
    let newRowIndex = checklist10?.checklist10Items.count
    checklist10?.checklist10Items.append(checklist10Item)
    
    let indexPath = IndexPath(row: newRowIndex!, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
    
    dismiss(animated: true, completion: nil)
    // saveChecklist10Items()
  }
  
  func checklist10ItemDetailViewController(_ controller: Checklist10ItemDetailViewController, didFinishEditing checklist10Item: Checklist10Item) -> () {
    if let index = checklist10?.checklist10Items.index(of: checklist10Item) {
      let indexPath = IndexPath(row: index, section: 0)
      if let cell = tableView.cellForRow(at: indexPath)
      {
        configureText(for: cell, with: checklist10Item)
      }
    }
    dismiss(animated: true, completion: nil)
    // saveChecklist10Items()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddChecklist10Item" {
      let navigationController = segue.destination as! UINavigationController
      
      let controller = navigationController.topViewController as! Checklist10ItemDetailViewController
      // TODO - broken: "Cannot assign value of type 'Checklist10ItemDetailViewController' to type 'Checklist10ItemDetailViewControllerDelegate?'"
      controller.delegate = self
    } else if segue.identifier == "EditChecklist10Item" {
      
        let navigationController = segue.destination as! UINavigationController
        let controller = navigationController.topViewController as! Checklist10ItemDetailViewController
      
      controller.delegate = self
      
      if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
        controller.checklist10ItemToEdit = checklist10?.checklist10Items[indexPath.row]
      }
      
    }
  }

}

