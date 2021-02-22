//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Yuri Ershov on 22.02.21.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webViewOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // Method to show html file in bundle instead simple label
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webViewOutlet.load(request)
        }

        

    }

    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
