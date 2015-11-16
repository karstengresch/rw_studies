//
//  ViewController.swift
//  BullsEye
//
//  Created by Karsten Gresch on 09.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  @IBOutlet weak var targetLabel: UILabel?
  @IBOutlet weak var slider: UISlider?
  @IBOutlet weak var scoreLabel: UILabel?
  @IBOutlet weak var roundLabel: UILabel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: Custom funcs
  func startNewRound() {
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider?.value = Float(currentValue)
    updateLabels()
  }
  
  func updateLabels() {
    // wonder if that's better than 'targetLabel.text = String(targetValue)'
    targetLabel?.text = "\(targetValue)"
    scoreLabel?.text = "\(score)"
    roundLabel?.text = "\(round)"
    // print("targetValue: \(targetValue)")    
  }
  
  
  // MARK: IBActions
  
  @IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    let points = 100 - difference
    score += points
    
    let message = "The current slider value is: \(currentValue).\nThe target value is: \(targetValue).\nThe difference was: \(difference).\nYou scored \(score) points."
    
    let alertController = UIAlertController(title: "Slider information.", message: message, preferredStyle: .Alert)
    let alertAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
    alertController.addAction(alertAction)
    presentViewController(alertController, animated: true, completion: nil )
    startNewRound()
  }
  
  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
    print("Slider value: \(currentValue) ")
  }

}

