//
//  AssetViewController.swift
//  PaintCode
//

//

import UIKit



class AssetViewController: UIViewController {


  @IBOutlet weak var stopWatchHandView: UIView?
  var isStopwatchRunning = false
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    // rotateStopWatchHand()
    
  }
  
  @IBAction func rotateStopWatchHand() {
    print("TAP!")

    if self.isStopwatchRunning == false {
      print("START")
    print("rotateStopWatchHand - running? \(isStopwatchRunning) ")
    animateStopwatchHand()
      

      
    } else {
      print("STOP")
      self.stopWatchHandView!.layer.removeAllAnimations()
      self.isStopwatchRunning = false
    }
    
    
  }

  func animateStopwatchHand() {
    self.isStopwatchRunning = true
    
    UIView.animateWithDuration(15.0, delay: 0, options: .CurveLinear, animations:
      {
        print("Animation closure")
        self.stopWatchHandView!.transform = CGAffineTransformRotate(self.stopWatchHandView!.transform, CGFloat(M_PI_4 * -45))
        self.isStopwatchRunning = true
      }, completion:
      { finished in
        // self.animateStopwatchHand()
        print("Animation completion closure")
        self.isStopwatchRunning = true
    })
    

  }
  
}



