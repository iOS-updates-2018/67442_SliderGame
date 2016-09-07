//
//  Game.swift
//  SliderGame
//
//  Created by Larry Heimann on 9/5/16.
//  Copyright © 2016 Larry Heimann. All rights reserved.
//

import Foundation

class Game {
  var currentValue: Int = 50
  var targetValue: Int = 0
  var score: Int = 0
  var round: Int = 0
  
  func startNewRound() {
    self.round += 1
    self.targetValue = 1 + Int(arc4random_uniform(100))
    self.currentValue = 50
  }
  
  func startNewGame() {
    score = 0
    round = 0
    startNewRound()
  }
  
  func calculateScore() {
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference
    switch difference {
    case 0:
      points += 100
    case 1:
      points += 50
    default:
      points += 0
    }
    score += points
  }
  
  func determineTitle() -> String {
    let difference = abs(targetValue - currentValue)
    var title: String
    switch difference {
    case 0:
      title = "Perfect!"
    case (1..<5):
      title = "You almost had it!"
    case (5..<10):
      title = "Pretty good!"
    default:
      title = "Not even close..."
    }
    return title
  }
  
  func generateMessage() -> String {
    let message = "The value of the slider is: \(currentValue) \nThe target value is: \(targetValue)"
    return message
  }
  
}