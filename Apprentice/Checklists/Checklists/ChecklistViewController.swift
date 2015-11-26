//
//  ViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 25.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
    let label = cell.viewWithTag(1000) as? UILabel
    
switch indexPath.row {
  
case (0):
  label?.text = "Walk the bird."
  
case (1):
  label?.text = "Brush your hair."
  
case (2):
  label?.text = "Learn singing."
  
case (3):
  label?.text = "Yoga practice."
  
case (4):
  label?.text = "Eat Filet Wellington."
  
default:
  label?.text = "Check the code."
    }
    
    return cell
  }
  

}

