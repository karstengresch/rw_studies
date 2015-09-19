//: Playground - noun: a place where people can play

import UIKit

enum MicrosoftCEOs: Int {
  case BillGates = 1
  case SteveBallmer
  case SatyaNadella
  init() {
    self = .SatyaNadella
  }
  func description() -> String {
    switch (self) {
    case .BillGates:
      return "Bill Gates"
    case .SteveBallmer:
      return "Steve Ballmer"
    case .SatyaNadella:
      return "Satya Nadella"
    }
  }
}

let currentCEO = MicrosoftCEOs()
println(currentCEO.description())

let oFirstCEO = MicrosoftCEOs(rawValue: 1)
if let firstCEO = oFirstCEO {
  println(firstCEO.description())
} else {
  println("No such value")
}



