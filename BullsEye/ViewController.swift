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
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        sliderValue.setThumbImage(thumbImageNormal, for: .normal)
        sliderValue.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: insets)
        sliderValue.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
        sliderValue.setMaximumTrackImage(trackRightImageResizable, for: .normal)
        
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
        // Also start new round when button inside alert is pressed
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        // Add button to popup
        alert.addAction(action)
        // Show popup alert when hitButtonPressed
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        // Add slider Int value to variable
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
    @IBAction func startOverButtonPressed(_ sender: UIButton) {
        score = 0
        round = 0
        startNewRound()
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

