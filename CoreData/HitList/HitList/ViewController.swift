//
//  ViewController.swift
//  HitList
//
//  Created by Karsten Gresch on 31.05.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "The List"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }

  @IBOutlet weak var tableView: UITableView!
  
  
  
  @IBAction func addName(_ sender: UIBarButtonItem) {
  }

  

}

extension ViewController: UITableViewDataSource {
  
}

