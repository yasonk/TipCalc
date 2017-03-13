//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Yason Khaburzaniya on 3/12/17.
//  Copyright © 2017 Yason Khaburzaniya. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tipPercentages : [Int: Int] = [0: 0, 18: 0, 20: 1, 25: 2]
        let defaults = UserDefaults.standard
        let percentage = defaults.integer(forKey: "default_tip_percentage")
        defaultTipControl.selectedSegmentIndex = tipPercentages[percentage]!
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tipPercentages = [18, 20, 25]
        
        let percentage = tipPercentages[defaultTipControl.selectedSegmentIndex]
        
        defaults.set(percentage, forKey: "default_tip_percentage")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
