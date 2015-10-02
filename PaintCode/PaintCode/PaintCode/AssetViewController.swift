//
//  AssetViewController.swift
//  PaintCode
//

//

import UIKit



class AssetViewController: UIViewController {


  @IBOutlet weak var stopWatchHandView: UIView?
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    rotateStopWatchHand()
    
  }
  
  func rotateStopWatchHand() {
    UIView.animateWithDuration(1.0, delay: 0, options: .CurveLinear, animations:
      { self.stopWatchHandView!.transform = CGAffineTransformRotate(self.stopWatchHandView!.transform, CGFloat(M_PI/15))
      }, completion:
      { finished in self.rotateStopWatchHand()
      })
  }
  
}

