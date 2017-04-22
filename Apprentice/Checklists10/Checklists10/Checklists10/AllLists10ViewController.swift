//
//  AllLists10ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 10.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class AllLists10ViewController: UITableViewController, ListDetailViewControllerDelegate, UINavigationControllerDelegate {
  
  var dataModel10: DataModel10!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
    navigationController?.delegate = self
    
    let index = dataModel10.indexOfSelectedChecklist10
    
    if index >= 0 && index < dataModel10.checklist10s.count {
      let checklist10 = dataModel10.checklist10s[index]
      performSegue(withIdentifier: "ShowChecklist10", sender: checklist10)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
    dataModel10.saveChecklist10s()
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataModel10.checklist10s.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = makeCell(for: tableView)
    let checklist10 = dataModel10.checklist10s[indexPath.row]
    if let textLabel = cell.textLabel {
      textLabel.text = checklist10.name
    }
    cell.accessoryType = .detailDisclosureButton
    // cell.showsReorderControl = true
    cell.detailTextLabel!.text = getDetailTextLabelByUncheckedItems(checklist10)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    dataModel10.checklist10s.remove(at: indexPath.row)
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
  }
  
  func makeCell(for tableView: UITableView) -> UITableViewCell {
    
    let cellIdentifier = "Cell10"
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
      return cell
    } else
    {
      return UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    dataModel10.indexOfSelectedChecklist10 = indexPath.row
    let checklist10 = dataModel10.checklist10s[indexPath.row]
    performSegue(withIdentifier: "ShowChecklist10", sender: checklist10)
  }
  
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    let navigationController = storyboard!.instantiateViewController(withIdentifier: "ListDetailViewController") as! UINavigationController
    let controller = navigationController.topViewController as! ListDetailViewController
    controller.delegate = self
    let checklist10 = dataModel10.checklist10s[indexPath.row]
    controller.checklist10ToEdit = checklist10
    present(navigationController, animated: true, completion: nil)
  }
  
  
  // MARK: Segue related
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowChecklist10" {
      let checklist10ViewController = segue.destination as! Checklist10ViewController
      checklist10ViewController.checklist10 = (sender as! Checklist10)
    } else if segue.identifier == "AddChecklist10" {
      let navigationController = segue.destination as! UINavigationController
      let controller = navigationController.topViewController as! ListDetailViewController
      controller.delegate = self
      controller.checklist10ToEdit = nil
    }
  }
  
  // MARK: ListDetailViewControllerDelegate methods
  func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
    dismiss(animated: true, completion: nil)
  }
  
  func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist10: Checklist10) {
    let newRowIndex = dataModel10.checklist10s.count
    dataModel10.checklist10s.append(checklist10)
    
    
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
    
    dismiss(animated: true, completion: nil)
  }
  
  func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist10: Checklist10) {
    if let index = dataModel10.checklist10s.index(of: checklist10) {
      let indexPath = IndexPath(row: index, section: 0)
      if let cell = tableView.cellForRow(at: indexPath) {
        cell.textLabel!.text = checklist10.name
      }
    }
    dismiss(animated: true, completion: nil)
  }
  
  func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    if viewController === self {
      dataModel10.indexOfSelectedChecklist10 = -1
    }
  }
  
  func getDetailTextLabelByUncheckedItems(_ checklist10: Checklist10) -> String {
    var detailTextLabelText = ""
    
    let count = checklist10.countUncheckedChecklist10Items()
    if checklist10.checklist10Items.count == 0 {
      detailTextLabelText = "(List empty)"
    }
    else if count == 0 {
      detailTextLabelText = "All done!"
    } else {
      detailTextLabelText = "\(checklist10.countUncheckedChecklist10Items()) remaining"
    }
    
    return detailTextLabelText
  }
  
}
