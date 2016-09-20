
//
//  ViewController.swift
//  tipssy
//
//  Created by edmund on 9/11/16.
//  Copyright © 2016 edmund. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var percentageTextField: UITextField!

    var percentage: Double = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .Plain,
            target: self,
            action: nil
        )
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        percentage = defaults.doubleForKey("tipPercentage")
        let percentageText = String(format: "%.2f%", percentage * 100)
        percentageLabel.text = "\(percentageText)%"
        percentageSlider.setValue(Float(percentage), animated: false)
        percentageTextField.hidden = true
        let percentageStr = String(format: "%.2f%", percentage * 100)
        percentageTextField.text = "\(percentageStr)%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onFieldsChange(sender: AnyObject) {
        let bill = Double(billTextField.text!) ?? 0
        
        let (tip, total) = calculateTip(bill, percentage: percentage)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        percentageSlider.setValue(Float(percentage), animated: true)
    }
    
    @IBAction func onBodyTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onPercentageTextFieldChange(sender: AnyObject) {
        percentageLabel.hidden = false
        percentageTextField.hidden = true
        let previousPercentage = percentage
        percentage = Double(percentageTextField.text!.stringByReplacingOccurrencesOfString("%", withString: ""))! / 100 ?? previousPercentage
        let percentageStr = String(format: "%.2f%", percentage * 100)
        percentageLabel.text = "\(percentageStr)%"
        
        onFieldsChange(self)
    }
    
    @IBAction func onPercentageSliderChange(sender: AnyObject) {
        let sliderPercentage = percentageSlider.value
        let percentageText = String(format: "%.2f%", sliderPercentage * 100)
        
        percentageLabel.text = "\(percentageText)%"
        percentage = Double(sliderPercentage)
        onFieldsChange(self)
    }

    @IBAction func onPercentageLabelClick(sender: AnyObject) {
        let percentageStr = String(format: "%.2f%", percentage * 100)
        percentageTextField.text = String("\(percentageStr)%")
        percentageLabel.hidden = true
        percentageTextField.hidden = false
        percentageTextField.becomeFirstResponder()
        let startPosition = percentageTextField.positionFromPosition(percentageTextField.beginningOfDocument, inDirection: UITextLayoutDirection.Right, offset: 0)
        let endPosition = percentageTextField.positionFromPosition(percentageTextField.beginningOfDocument, inDirection: UITextLayoutDirection.Right, offset: percentageStr.characters.count)
        percentageTextField.selectedTextRange = percentageTextField.textRangeFromPosition(startPosition!, toPosition: endPosition!)
    }
    
    private
    
    func calculateTip(bill: Double, percentage: Double) -> (Double, Double) {
        let tip = getTip(bill, percentage: percentage)
        
        let total = getTotal(bill, percentage: percentage)
        
        return (tip, total)
    }
    
    func getTip(bill: Double, percentage: Double) -> Double {
        return percentage * bill
    }
    
    func getTotal(bill: Double, percentage: Double) -> Double {
        let tip = getTip(bill, percentage: percentage)
        
        return bill + tip
    }
}

