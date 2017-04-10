//
//  AllLists10ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 10.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class AllLists10ViewController: UITableViewController, ListDetailViewControllerDelegate {
  
  var checklist10s: [Checklist10]
  
  required init?(coder aDecoder: NSCoder) {
    checklist10s = [Checklist10]()
    super.init(coder: aDecoder)
    
    var checklist10 = Checklist10(name: "Dionysos")
    checklist10s.append(checklist10)
    
    checklist10 = Checklist10(name: "Nymphs")
    checklist10s.append(checklist10)
    
    checklist10 = Checklist10(name: "Satyrs")
    checklist10s.append(checklist10)
    
    checklist10 = Checklist10(name: "Bacchanal")
    checklist10s.append(checklist10)
    
    for checklist10 in checklist10s {
      let checklist10Item = Checklist10Item()
      checklist10Item.text = "Item for \(checklist10.name)"
      checklist10.checklist10Items.append(checklist10Item)
    }
    
  }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist10s.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        let checklist10 = checklist10s[indexPath.row]
        if let textLabel = cell.textLabel {
          textLabel.text = checklist10.name
        }
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    checklist10s.remove(at: indexPath.row)
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
  }
  
  func makeCell(for tableView: UITableView) -> UITableViewCell {
    
    let cellIdentifier = "Cell10"
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
      return cell
    } else
    {
      return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let checklist10 = checklist10s[indexPath.row]
    performSegue(withIdentifier: "ShowChecklist10", sender: checklist10)
  }
  
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    let navigationController = storyboard!.instantiateViewController(withIdentifier: "ListDetailViewController") as! UINavigationController
    let controller = navigationController.topViewController as! ListDetailViewController
    controller.delegate = self
    let checklist10 = checklist10s[indexPath.row]
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
    let newRowIndex = checklist10s.count
    checklist10s.append(checklist10)
    
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
    
    dismiss(animated: true, completion: nil)
  }
  
  func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist10: Checklist10) {
    if let index = checklist10s.index(of: checklist10) {
      let indexPath = IndexPath(row: index, section: 0)
      if let cell = tableView.cellForRow(at: indexPath) {
        cell.textLabel!.text = checklist10.name
      }
    }
   dismiss(animated: true, completion: nil)
  }
  
 
   // MARK: Persistence related
   
   // Utility methods
   func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
   }
  
  
   func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("Checklist10.plist")
   }
  
  
  func saveChecklist10s() {
    
  }
  
  /*
  
   // Persistence stuff
   func saveChecklist10Items() {
   let data = NSMutableData()
   let archiver = NSKeyedArchiver(forWritingWith: data)
   archiver.encode(checklist10?.checklist10Items, forKey: "Checklist10Items")
   archiver.finishEncoding()
   data.write(to: dataFilePath(), atomically: true)
   }
   
   func loadChecklist10Items() {
   let path = dataFilePath()
   if let data = try? Data(contentsOf: path) {
   let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
   checklist10?.checklist10Items = unarchiver.decodeObject(forKey: "Checklist10Items") as! [Checklist10Item]
   unarchiver.finishDecoding()
   }
   }
   */
  
}
