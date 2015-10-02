//
//  Stopwatch.swift
//  PaintCode
//
//  Created by Karsten Gresch on 02.10.15.
//

import UIKit

@IBDesignable
class Stopwatch: UIView {
  override func drawRect(rect: CGRect) {
    PaintCodeTutorial.drawStopwatch()
  }
}
