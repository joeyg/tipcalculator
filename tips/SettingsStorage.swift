//
//  SettingsStorage.swift
//  tips
//
//  Created by Joe Gasiorek on 4/8/15.
//  Copyright (c) 2015 Joe Gasiorek. All rights reserved.
//

import Foundation

class SettingsStorage {
    let keys = ["first", "second", "third"]
    
    func saveOptionValues(first:Double, second:Double, third:Double) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(first, forKey: keys[0])
        defaults.setDouble(second, forKey: keys[1])
        defaults.setDouble(third, forKey: keys[2])
        defaults.synchronize()
    }
    
    func getOptionValue(item:Int) -> Double {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        return defaults.doubleForKey(keys[item])
    }
}