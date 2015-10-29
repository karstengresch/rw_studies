//
//  Knobb.swift
//  KnobDemo
//
//  Created by Karsten Gresch on 29.10.15.
//  Copyright © 2015 Mikael Konutgan. All rights reserved.
//

import UIKit

public class Knob: UIControl {

  public override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = tintColor
    
  }
  
  public required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented!")
  }


}
