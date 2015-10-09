//
//  ViewController.swift
//  RWBooks
//
//  Created by Main Account on 5/13/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

// http://www.materialpalette.com/light-blue/deep-orange

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIViewControllerTransitioningDelegate {
  
  @IBOutlet weak var avatarView: AvatarView!
  @IBOutlet weak var topView: UIView!
  @IBOutlet weak var followButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!
  
  let books = Book.all
  
  override func viewDidLoad() {
    super.viewDidLoad()
    followButton.layer.cornerRadius = 8.35

  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return books.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BookCell", forIndexPath: indexPath) as! BookCell
    
    let book = books[indexPath.row]
    cell.imageView.image = book.cover
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    _ = self.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! BookCell
    performSegueWithIdentifier("ShowBook", sender: indexPath)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let indexPath = sender as? NSIndexPath {
      let destVC = segue.destinationViewController as! BookViewController
      destVC.book = books[indexPath.row]
    }
  }
  
  @IBAction func unwindToProfileView(sender: UIStoryboardSegue) {
  }
  
}

