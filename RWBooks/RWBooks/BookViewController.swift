//
//  BookViewController.swift
//  RWBooks
//
//  Created by Main Account on 5/13/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

class BookViewController : UIViewController {

  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookImageView: UIImageView!
  @IBOutlet weak var bookAuthorsLabel: UILabel!
  @IBOutlet weak var stepper: UIStepper!
  @IBOutlet weak var statView: StatView!
  @IBOutlet weak var topView: UIView!
  @IBOutlet weak var doneButton: UIButton!
  
  var book: Book?

  override func viewWillAppear(animated: Bool) {
    
    doneButton.layer.cornerRadius = CGRectGetHeight(doneButton.bounds) / 2
    
    if let book = book {
      bookImageView.image = book.cover
      bookTitleLabel.text = book.title
      bookAuthorsLabel.text = book.authors

      statView.range = CGFloat(book.chaptersTotal)     
      statView.curValue = CGFloat(book.chaptersRead)
      stepper.value = Double(book.chaptersRead)
      stepper.maximumValue = Double(book.chaptersTotal)
    }
    
  }

  @IBAction func stepperValueDidChange(stepper: UIStepper) {
    statView.curValue = CGFloat(stepper.value)
  }
}