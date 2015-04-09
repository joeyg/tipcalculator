//
//  SettingsViewController.swift
//  tips
//
//  Created by Joe Gasiorek on 4/8/15.
//  Copyright (c) 2015 Joe Gasiorek. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var firstOptionField: UITextField!
    @IBOutlet weak var secondOptionField: UITextField!
    @IBOutlet weak var thirdOptionField: UITextField!
    
    var storage:SettingsStorage
    
    required init(coder aDecoder: NSCoder!) {
        storage = SettingsStorage()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstOptionField.text = String(format:"%.2f", storage.getOptionValue(0))
        secondOptionField.text = String(format:"%.2f", storage.getOptionValue(1))
        thirdOptionField.text = String(format:"%.2f", storage.getOptionValue(2))
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        var firstValue = getDoubleValueForField(firstOptionField)
        var secondValue = getDoubleValueForField(secondOptionField)
        
        var thirdValue = getDoubleValueForField(thirdOptionField)
        
        storage.saveOptionValues(firstValue, second:secondValue, third:thirdValue)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func getDoubleValueForField(field:UITextField) -> Double {
        return field.text._bridgeToObjectiveC().doubleValue
    }
}