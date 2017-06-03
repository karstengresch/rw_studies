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
  
  var names: [String] = []
  
  @IBAction func addName(_ sender: UIBarButtonItem) {
  }

  

}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
  }
  
  
  
}

