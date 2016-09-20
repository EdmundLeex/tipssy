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
    }
    
    override func viewWillAppear(animated: Bool) {
        let percentage = defaults.doubleForKey("tipPercentage") ?? 0.0
        let percentageText = String(format: "%.2f%", percentage * 100)
        defaultPercentageTextField.text = "\(percentageText)%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        let defaultPercentage = Double(defaultPercentageTextField.text!.stringByReplacingOccurrencesOfString("%", withString: "")) ?? 0.0
        defaults.setDouble(defaultPercentage / 100, forKey: "tipPercentage")
        defaults.synchronize()
        super.viewWillDisappear(animated)
    }

    @IBAction func onDefaultPercentageTextFieldTap(sender: AnyObject) {
        let percentage = defaults.doubleForKey("tipPercentage") ?? 0.0
        let percentageStr = String(format: "%.2f%", percentage * 100)
        
        let startPosition = defaultPercentageTextField.positionFromPosition(defaultPercentageTextField.beginningOfDocument, inDirection: UITextLayoutDirection.Right, offset: 0)
        let endPosition = defaultPercentageTextField.positionFromPosition(defaultPercentageTextField.beginningOfDocument, inDirection: UITextLayoutDirection.Right, offset: percentageStr.characters.count)
        defaultPercentageTextField.selectedTextRange = defaultPercentageTextField.textRangeFromPosition(startPosition!, toPosition: endPosition!)

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
