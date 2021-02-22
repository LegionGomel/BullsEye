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
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func hitButtonPressed(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        let message = "You've scored \(points) points"
        // Create popup alert controller
        let alert = UIAlertController(title: "Hello world!", message: message, preferredStyle: .alert)
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
        // Generate new target value and reset slider value
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        sliderValue.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        // Update text for labels
        randomValueLabel.text = String(targetValue)
    }

}

