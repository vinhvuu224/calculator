//
//  SettingsViewController.swift
//  calculator
//
//  Created by Vinh Vu on 11/24/19.
//  Copyright © 2019 Vinh Vu. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var inputTipPercentage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }
    @IBAction func savedTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Set a String value for some key.
        defaults.set(Double(inputTipPercentage.text!), forKey: "savedTip")
        
        // Force UserDefaults to save.
        defaults.synchronize()
    }
}
