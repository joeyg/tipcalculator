//
//  ViewController.swift
//  tips
//
//  Created by Joe Gasiorek on 4/8/15.
//  Copyright (c) 2015 Joe Gasiorek. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaultTipValues = [18.0, 20.0, 22.0]
    
    var storage: SettingsStorage
    
    required init(coder aDecoder: NSCoder!) {
        storage = SettingsStorage()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(animated: Bool) {
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        for var i = 0; i < 3; i++ {
            var val = storage.getOptionValue(i)
            
            if val == 0 {
                val = defaultTipValues[i]
            }
            
            var strVal = String(format:"%.2f", val)
            tipControl.setTitle(strVal, forSegmentAtIndex: Int(i))
        }
        
        billField.becomeFirstResponder()
        
        if !billField.text.isEmpty {
            onEditingChanged(billField)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tipAmount = billAmount * (storage.getOptionValue(tipControl.selectedSegmentIndex) / 100)
        
        var total = billAmount + tipAmount
        
        var tipString = getCurrencyStringForDouble(tipAmount)
        var totalString = getCurrencyStringForDouble(total)
        
        tipLabel.text = tipString
        totalLabel.text = totalString
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func getCurrencyStringForDouble(number:Double) -> String? {
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        
        return numberFormatter.stringFromNumber(number)
    }
}

