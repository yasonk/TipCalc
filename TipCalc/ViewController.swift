//
//  ViewController.swift
//  TipCalc
//
//  Created by Yason Khaburzaniya on 3/12/17.
//  Copyright © 2017 Yason Khaburzaniya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tipPercentages : [Int: Int] = [0: 0, 18: 0, 20: 1, 25: 2]
        let defaults = UserDefaults.standard
        let percentage = defaults.integer(forKey: "default_tip_percentage")
        tipControl.selectedSegmentIndex = tipPercentages[percentage]!
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBackground(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        animateValues()
    }
    
    func animateValues() {
        UIView.animate(withDuration: 0.5, animations: {
            self.tipLabel.layer.backgroundColor = UIColor.darkGray.cgColor
            self.totalLabel.layer.backgroundColor = UIColor.darkGray.cgColor
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            self.tipLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.totalLabel.layer.backgroundColor = UIColor.clear.cgColor
        })
    }
}

