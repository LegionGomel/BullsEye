//
//  ViewController.swift
//  BullsEye
//
//  Created by Yuri Ershov on 21.02.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hitButtonPressed(_ sender: Any) {
        
        // Create popup alert controller
        let alert = UIAlertController(title: "Hello world!", message: "This is my first app", preferredStyle: .alert)
        // Create popup alert action (a button inside)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        // Add button to popup
        alert.addAction(action)
        // Show popup alert when hitButtonPressed
        present(alert, animated: true, completion: nil)
    }
    
}

