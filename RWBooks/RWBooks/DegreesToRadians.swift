//
//  DegreesToRadians.swift
//  MyStats3
//
//  Created by Main Account on 5/11/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

func DegreesToRadians (value:CGFloat) -> CGFloat {
    return value * CGFloat(M_PI) / 180.0
}

func RadiansToDegrees (value:CGFloat) -> CGFloat {
    return value * 180.0 / CGFloat(M_PI)
}