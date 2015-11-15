//
//  ViewController.swift
//  BullsEye
//
//  Created by Karsten Gresch on 09.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var currentValue: Int = 0
  var targetValue: Int = 0
  
  @IBOutlet weak var slider: UISlider?

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
  }
  
  
  // MARK: IBActions
  
  @IBAction func showAlert() {
    let message = "The current slider value is: \(currentValue) \nThe target value is: \(targetValue)"
    
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

