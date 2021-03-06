/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import CoreData

class ViewController: UIViewController {
  
  var managedContext: NSManagedObjectContext!
  var currentBowtie: Bowtie!

  // MARK: - IBOutlets
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var timesWornLabel: UILabel!
  @IBOutlet weak var lastWornLabel: UILabel!
  @IBOutlet weak var favoriteLabel: UILabel!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    insertSampleData()
    let fetchRequest = NSFetchRequest<Bowtie>(entityName: "Bowtie")
    let firstTitle = segmentedControl.titleForSegment(at: 0)!
    
    fetchRequest.predicate = NSPredicate(format: "searchKey == %@", firstTitle)
    
    do {
      let results = try managedContext.fetch(fetchRequest)
      currentBowtie = results.first
      populate(bowtie: results.first!)
      
    } catch let error as NSError {
      print("Could not fetch \(error), \(error.userInfo)")
    }
  }

  // MARK: - IBActions
  @IBAction func segmentedControl(_ sender: AnyObject) {
    
    guard let segmentedControl = sender as? UISegmentedControl else {
      return
    }
    
    let selectedValue = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
    
    let fetchRequest = NSFetchRequest<Bowtie>(entityName: "Bowtie")
    fetchRequest.predicate = NSPredicate(format: "searchKey == %@", selectedValue!)
    
    do {
      let results =
      try managedContext.fetch(fetchRequest)
      currentBowtie = results.first
      populate(bowtie: currentBowtie)
    } catch let error as NSError {
      print("Could not fetch \(error), \(error.userInfo)")
    }
  }

  @IBAction func wear(_ sender: AnyObject) {
    let timesWorn = currentBowtie.timesWorn
    currentBowtie.timesWorn = timesWorn + 1
    currentBowtie.lastWorn = NSDate()
    
    do {
      try managedContext.save()
      populate(bowtie: currentBowtie)
    } catch let error as NSError {
      print("Could not fetch \(error), \(error.userInfo)")
    }
  }
  
  @IBAction func rate(_ sender: AnyObject) {
    let rateAlert = UIAlertController(title: "New Rating", message: "Rate this bow tie", preferredStyle: .alert)
    
    rateAlert.addTextField { (textField) in textField.keyboardType = .decimalPad }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .default)
    let saveAction = UIAlertAction(title: "Save", style: .default) {
      [unowned self] action in
      
      guard let textField = rateAlert.textFields?.first else {
        return
      }
      
      self.update(rating: textField.text)
      
    }
    
    rateAlert.addAction(cancelAction)
    rateAlert.addAction(saveAction)
    
    present(rateAlert, animated: true)
  }
  
  
  func update(rating: String?) {
    
    guard let ratingString = rating, let rating = Double(ratingString) else {
      return
    }
    
    do {
      currentBowtie.rating = rating
      try managedContext.save()
      populate(bowtie: currentBowtie)
    } catch let error as NSError {
      
      
      if error.domain == NSCocoaErrorDomain && error.code == NSValidationNumberTooLargeError {
        update(rating: "5")
      } else if error.domain == NSCocoaErrorDomain && error.code == NSValidationNumberTooSmallError {
        update(rating: "0")
      }
      
      else {
        print("Could not fetch \(error), \(error.userInfo)")
      }
      
    }
  }
  
  func insertSampleData() {
    let fetchRequest = NSFetchRequest<Bowtie>(entityName: "Bowtie")
    fetchRequest.predicate = NSPredicate(format: "searchKey != nil")
    
    let count = try! managedContext.count(for: fetchRequest)
    
    if count > 0 {
      return
    }
    
    let sampleDataPath = Bundle.main.path(forResource: "SampleData", ofType: "plist")
    let dataArray = NSArray(contentsOfFile: sampleDataPath!)!
    
    for dict in dataArray {
    
      let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext)!
      let bowtie = Bowtie(entity: entity, insertInto: managedContext)
      let bowtieDictionary = dict as! [String: AnyObject]
      
      bowtie.name = bowtieDictionary["name"] as? String
      bowtie.searchKey = bowtieDictionary["searchKey"] as? String
      bowtie.rating = bowtieDictionary["rating"] as! Double
      let colorDictionary = bowtieDictionary["tintColor"] as! [String: AnyObject]
      bowtie.tintColor = UIColor.color(colorDictionary: colorDictionary)
      
      let imageName = bowtieDictionary["imageName"] as? String
      let image = UIImage(named: imageName!)
      let photoData = UIImagePNGRepresentation(image!)!
      bowtie.photoData = NSData(data: photoData)
      
      bowtie.lastWorn = bowtieDictionary["lastWorn"] as? NSDate
      let timesNumber = bowtieDictionary["timesWorn"] as! NSNumber
      bowtie.timesWorn = timesNumber.int32Value
      bowtie.isFavorite = bowtieDictionary["isFavorite"] as! Bool
      
    }
    
    try! managedContext.save()
    
  }
  
  func populate(bowtie: Bowtie) {
    guard let imageData = bowtie.photoData as Data?,
          let lastWorn = bowtie.lastWorn as Date?,
          let tintColor = bowtie.tintColor as? UIColor
    else {
      return
    }
    
    imageView.image = UIImage(data: imageData)
    nameLabel.text = bowtie.name
    ratingLabel.text = "Rating: \(bowtie.rating)/5"
    timesWornLabel.text = "# times worn: \(bowtie.timesWorn)"
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    
    lastWornLabel.text = "Last worn: \(dateFormatter.string(from: lastWorn))"
    favoriteLabel.isHidden = !bowtie.isFavorite
    view.tintColor = tintColor
  }
  
  
}

private extension UIColor {
  
  static func color(colorDictionary: [String : AnyObject]) -> UIColor? {
    guard  let red = colorDictionary["red"] as? NSNumber,
           let green = colorDictionary["green"] as? NSNumber,
          let blue = colorDictionary["blue"] as? NSNumber
      else {
      return nil
    }
    
    return UIColor(red: CGFloat(red)/255.0,
                   green: CGFloat(green)/255.0,
                   blue: CGFloat(blue)/255.0,
                   alpha: 1)
  }
}
