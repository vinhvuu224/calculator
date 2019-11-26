//
//  ViewController.swift
//  calculator
//
//  Created by Vinh Vu on 11/20/19.
//  Copyright © 2019 Vinh Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
 
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipDefault: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        let defaults = UserDefaults.standard
        if let intValue = defaults.object(forKey: "savedTip") as? Double {
            self.tipDefault = intValue/100
            self.calculateTip(self)
        } else {
            self.tipDefault = nil
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        var tipPercentage: Double = tipPercentages[tipControl.selectedSegmentIndex]
        if let _ = sender as? UISegmentedControl {
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        } else if let defaultTip = self.tipDefault {
            tipPercentage = defaultTip
        }
        let tip  = bill * tipPercentage
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
    }
    
}

