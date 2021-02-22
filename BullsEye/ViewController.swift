//
//  ViewController.swift
//  BullsEye
//
//  Created by Yuri Ershov on 21.02.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sliderValue: UISlider!
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func hitButtonPressed(_ sender: Any) {
        
        let message = "Current slider value is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
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
        let roundedValue = sliderValue.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        sliderValue.value = Float(currentValue)
    }
}

