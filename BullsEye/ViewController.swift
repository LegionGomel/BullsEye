//
//  ViewController.swift
//  BullsEye
//
//  Created by Yuri Ershov on 21.02.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var randomValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func hitButtonPressed(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points

        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            score += 100
        } else if difference < 5 {
            title = "You've almost had it!"
            if difference == 1 {
                score += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You've scored \(points) points"
        // Create popup alert controller
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Create popup alert action (a button inside)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        // Add button to popup
        alert.addAction(action)
        // Show popup alert when hitButtonPressed
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        // Add slider Int value to variable
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
    func startNewRound() {
        round += 1
        // Generate new target value and reset slider value
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        sliderValue.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        // Update text for labels
        randomValueLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

