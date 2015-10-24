//
//  ViewController.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-16.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {
  
  var holderView = HolderView(frame: CGRectZero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    addHolderView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func addHolderView() {
    let boxSize: CGFloat = 100.0
    holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                              y: view.bounds.height / 2 - boxSize / 2,
                              width: boxSize,
                              height: boxSize)
    holderView.parentFrame = view.frame
    holderView.delegate = self
    
    view.addSubview(holderView)
    holderView.addOval()
  }
  
  func animateLabel() {
    
    holderView.removeFromSuperview()
    view.backgroundColor = Colors.blue
    
    var label = UILabel(frame: view.frame)
    label.textColor = Colors.white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 170.0)
    label.textAlignment = NSTextAlignment.Center
    label.text = "G"
    label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
    view.addSubview(label)
    
    UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: ( { label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0) } ), completion: { finished in self.addButton() })
    
    
    

  }
  
  func addButton() {
    let button = UIButton()
    button.frame = CGRectMake(0.0, 0.0, view.bounds.width, view.bounds.height)
    button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
    view.addSubview(button)
  }
  
  func buttonPressed(sender: UIButton!) {
    view.backgroundColor = Colors.white
    view.subviews.forEach({ $0.removeFromSuperview() })
    holderView = HolderView(frame: CGRectZero)
    addHolderView()
  }
}

