//
//  ViewController.swift
//  KnobDemo
//
//  Created by Mikael Konutgan on 05/09/14.
//  Copyright (c) 2014 Mikael Konutgan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var knobPlaceholder: UIView!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var valueSlider: UISlider!
    @IBOutlet var animateSwitch: UISwitch!
  
    var knob: Knob!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        knob = Knob(frame: knobPlaceholder.bounds)
        knobPlaceholder.addSubview(knob)
        knob.lineWidth = 4.0
        knob.pointerLength = 12.0
      
        view.tintColor = UIColor.orangeColor()
      
    }
    
    @IBAction func sliderValueChanged(slider: UISlider) {
      knob.value = slider.value
      updateLabel()
    }
    
    @IBAction func randomButtonTouched(button: UIButton) {
      let randomValue = Float(arc4random_uniform(101)) / 100.0
      knob.setValue(randomValue, animated: animateSwitch.on)
      valueSlider.setValue(randomValue, animated: animateSwitch.on)
      updateLabel()
    }
  
  func updateLabel() {
    valueLabel.text = NSNumberFormatter.localizedStringFromNumber(knob.value, numberStyle: .DecimalStyle)
  }
}
