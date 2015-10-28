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
    }
    
    @IBAction func sliderValueChanged(slider: UISlider) {
    }
    
    @IBAction func randomButtonTouched(button: UIButton) {
    }
}
