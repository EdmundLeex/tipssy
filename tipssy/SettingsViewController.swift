//
//  SettingsViewController.swift
//  tipssy
//
//  Created by edmund on 9/11/16.
//  Copyright © 2016 edmund. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var defaultPercentageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let percentage = defaults.doubleForKey("tipPercentage") ?? 0.0
        let percentageText = String(format: "%.2f%", percentage * 100)
        defaultPercentageTextField.text = "\(percentageText)%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(sender: AnyObject) {
        let defaultPercentage = Double(defaultPercentageTextField.text!.stringByReplacingOccurrencesOfString("%", withString: "")) ?? 0.0
        defaults.setDouble(defaultPercentage / 100, forKey: "tipPercentage")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
