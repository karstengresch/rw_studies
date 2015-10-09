//
//  Book.swift
//  RWBooks
//
//  Created by Main Account on 5/13/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

struct Book {

  let title: String
  let cover: UIImage
  let authors: String
  let description: String
  let chaptersRead: Int
  let chaptersTotal: Int

  static let all: [Book] = [
  
    Book(title: "WatchKit by Tutorials", cover: UIImage(named: "awt")!, authors: "By Ryan Nystrom, Scott Atkinson, Soheil Azarpour, Matthew Morey, Ben Morrow, Audrey Tam, and Jack Wu", description: "Make Apple Watch Apps with Swift! Get a head start making apps for the Apple Watch, using WatchKit and Swift. Learn about WatchKit UI controls and layout, Glances, notifications, deep linking with Handoff, and more!", chaptersRead: 5, chaptersTotal: 15),
    Book(title: "Beat 'Em Up Starter Kit", cover: UIImage(named: "bgsk")!, authors: "By Allen Tan", description: "Learn to make a beat ‘em up game! The Beat ‘Em Up Game Starter Kit is designed to make learning how to create beat-em-up games easy, fast and fun!", chaptersRead: 8, chaptersTotal: 9),
    Book(title: "Core Data by Tutorials", cover: UIImage(named: "cdt")!, authors: "By Aaron Douglas, Saul Mora, Matthew Morey, and Pietro Rea", description: "Learn Core Data with Swift! Take control of your data in iOS apps using Core Data, Apple’s powerful object graph and persistence framework.", chaptersRead: 1, chaptersTotal: 10),
    Book(title: "iOS 6 by Tutorials", cover: UIImage(named: "i6t")!, authors: "By Evan Dekhayser, James Frost, Matt Galloway, Jake Gundersen, Kauserali Hafizji, Dominik Hauser, Matthijs Hollemans, Ron Kliffer, Felipe Laso Marsetti, Pierre Rochon, Marin Todorov, Brandon Trebitowski, and Ray Wenderlich", description: "Learn the iOS 6 APIs! Get up to speed with the APIs introduced in iOS 6 like Collection Views, Auto Layout, and Passbook!", chaptersRead: 15, chaptersTotal: 23),
    Book(title: "iOS 7 by Tutorials", cover: UIImage(named: "i7t")!, authors: "By Christine Abernathy, Soheil Moayedi Azarpour, Colin Eberhardt, Charlie Fulton, Matt Galloway, Greg Heo, Matthijs Hollemans, Felipe Laso Marsetti, Jeremy Olson, Pietro Rea, Audrey Tam, Marin Todorov, Cesare Rocchi, Jamie Syke, and Chris Wagner", description: "Learn the iOS 7 APIs! Get up to speed with the APIs introduced in iOS 7 like UIKit Dynamics, Text Kit, background fetch, and the new “flat” design!", chaptersRead: 20, chaptersTotal: 25),
    Book(title: "iOS 8 by Tutorials", cover: UIImage(named: "i8t")!, authors: "By Soheil Azarpour, Ricardo Rendon Cepeda, Tammy Coron, Sam Davies, Jake Gundersen, Mike Katz, Chris Lowe, Vincent Ngo, Ryan Nystrom, Cesare Rocchi, Audrey Tam, Chris Wagner, Nicholas Waynik, and Jack Wu", description: "Learn the new iOS 8 APIs! Learn about the new APIs in iOS 8 such as Adaptive UI, App Extensions, and Cloud Kit!", chaptersRead: 20, chaptersTotal: 30),
    Book(title: "iOS Apprentice", cover: UIImage(named: "ia1234")!, authors: "By Matthijs Hollemans", description: "Learn how to make apps with Swift! Learn how to make iPhone and iPad apps from the ground up, with a series of epic-length tutorials for beginners!", chaptersRead: 4, chaptersTotal: 4),
    Book(title: "Platformer Game Starter Kit", cover: UIImage(named: "pgsk")!, authors: "By Jake Gundersen", description: "Learn to make awesome platformer games! The Platformer Game Starter Kit is designed to make learning how to create platformer games easy, fast and fun!", chaptersRead: 5, chaptersTotal: 9),
    Book(title: "Space Game Starter Kit", cover: UIImage(named: "sgsk")!, authors: "By Ray Wenderlich", description: "Learn to make a space game for iOS! The Space Game Starter Kit is designed to make learning how to create side-scrolling games easy, fast and fun!", chaptersRead: 4, chaptersTotal: 4),
    Book(title: "iOS Games by Tutorials", cover: UIImage(named: "skt")!, authors: "By Mike Berg, Tom Bradley, Mike Daley, Jake Gundersen, Kauserali Hafizji, Matthijs Hollemans, Chris LaPollo, Rod Strougo, Marin Todorov, and Ray Wenderlich", description: "Learn to make iOS games! Learn how to make your own iOS games using Swift and Apple’s game framework, Sprite Kit.", chaptersRead: 20, chaptersTotal: 28),
    Book(title: "Swift by Tutorials", cover: UIImage(named: "swt")!, authors: "By Colin Eberhardt and Matt Galloway", description: "Learn Swift via tutorials! Learn Apple’s brand new programming language, Swift, the quick and easy way: via hands-on tutorials!", chaptersRead: 8, chaptersTotal: 10)
  
  ]

}