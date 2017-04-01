//
//  AllLists10ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 10.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class AllLists10ViewController: UITableViewController {
  
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
        let checklist = checklist10s[indexPath.row]
        if let textLabel = cell.textLabel {
          textLabel.text = checklist.name
        }
        cell.accessoryType = .detailDisclosureButton
        return cell
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
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
  }

}
