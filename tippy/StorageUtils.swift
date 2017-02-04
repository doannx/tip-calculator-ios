//
//  StorageUtils.swift
//  tippy
//
//  Created by john on 2/3/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import Foundation

private let TIP_KEY:String = "tipPercent"
private let TIP_DEFAULT_VALUE:Int = 15

private let TIME_OUT = 600
private let BILL_KEY:String = "billAmount"
private let LAST_ACTIVE_KEY:String = "lastActive"

extension NSUserDefaults {
    
    /**
     Save the selected tip value.
     @param tipPercent.
     @return void.
     */
    func saveTipPercent(tipPercent:Int) {
        NSUserDefaults.standardUserDefaults().setInteger(tipPercent, forKey: TIP_KEY)
    }
    
    /**
     Load the saved tip value.
     @return Saved tip value.
     */
    func loadTipPercent() -> Int {
        if let _ = NSUserDefaults.standardUserDefaults().objectForKey(TIP_KEY) {
            return NSUserDefaults.standardUserDefaults().integerForKey(TIP_KEY);
        }
        return TIP_DEFAULT_VALUE
    }
    
    func loadBillAmount() -> String {
        let lastActive = NSUserDefaults.standardUserDefaults().integerForKey(LAST_ACTIVE_KEY)
        let now = NSDate()
        
        if(Int(now.timeIntervalSince1970) - lastActive <= TIME_OUT) {
            return NSUserDefaults.standardUserDefaults().stringForKey(BILL_KEY)!
        }
        return ""
    }
    
    func saveBillAmount(lastBillAmount:String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(lastBillAmount, forKey: BILL_KEY)
        
        let date = NSDate()
        let timeSecond = Int(date.timeIntervalSince1970)
        
        defaults.setInteger(timeSecond, forKey: LAST_ACTIVE_KEY)
        
        defaults.synchronize()
    }
}
