//
//  ViewController.swift
//  Countidon
//
//  Created by Karsten Gresch on 18.09.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
  @IBOutlet weak var counterView: CounterView?
  @IBOutlet weak var counterLabel: UILabel?
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var graphView: GraphView!
  
  var isGraphViewShowing = true
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    counterLabel?.text = String(counterView?.counter)
    
    let tapGR = UITapGestureRecognizer(target: self, action: "counterViewTap:")
    self.containerView.addGestureRecognizer(tapGR)
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: Actions
  
  @IBAction func pushButtonPressed(button: PushButtonView) {
    if button.isAddButton {
      if counterView?.counter <= NumberOfGlasses {
        counterView?.counter++
      }
    } else {
      if counterView?.counter > 0 {
        counterView?.counter--
      }
    }
    
    if let currentCounter = counterView?.counter
    {
      print(currentCounter)
      counterLabel!.text = String(currentCounter)
    }
      
    if isGraphViewShowing {
      counterViewTap(nil)
    }
    
  }
  
  @IBAction func counterViewTap(gestureRecognizer: UITapGestureRecognizer?) {
    print("******* in tapped 1")
    // if let counterViewTapped = counterView, let graphViewTapped = graphView
    // {
      print("******* in tapped 2")
      if (isGraphViewShowing) {
        UIView.transitionFromView(graphView!, toView: counterView!, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
        
      } else {
        UIView.transitionFromView(counterView!, toView: graphView!, duration: 1.0, options: [UIViewAnimationOptions.TransitionFlipFromRight, UIViewAnimationOptions.ShowHideTransitionViews], completion: nil)
      }
      isGraphViewShowing = !isGraphViewShowing
 //    }
    
    
  }
  
  
  
}

