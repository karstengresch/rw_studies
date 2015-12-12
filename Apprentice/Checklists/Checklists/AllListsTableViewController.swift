//
//  AllListsTableViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 11.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = cellForTableView(tableView)
    cell.textLabel?.text = "List \(indexPath.row)"
    return cell
  }
  
  
  func cellForTableView(tableView: UITableView) -> UITableViewCell {
    let cellIdentifier = "AllListsCell"
    var returnCell: UITableViewCell?
    
    if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
      returnCell = cell
    } else {
      returnCell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
    }
    
    return returnCell!
  }
  
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("ShowChecklist", sender: nil)
  }
  
}
