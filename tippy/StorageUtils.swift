//
//  StorageUtils.swift
//  tippy
//
//  Created by john on 2/3/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import Foundation

extension NSUserDefaults {
    
    /**
     Save the selected tip value.
     @param tipPercent.
     @return void.
     */
    func saveTipPercent(tipPercent:Int) {
        NSUserDefaults.standardUserDefaults().setInteger(tipPercent, forKey: Const.Tip_Key)
    }
    
    /**
     Load the saved tip value.
     @return Saved tip value.
     */
    func loadTipPercent() -> Int {
        if let _ = NSUserDefaults.standardUserDefaults().objectForKey(Const.Tip_Key) {
            return NSUserDefaults.standardUserDefaults().integerForKey(Const.Tip_Key);
        }
        return Const.Tip_Default_Value
    }
    
    func loadBillAmount() -> String {
        let lastActive = NSUserDefaults.standardUserDefaults().integerForKey(Const.Last_Active_Key)
        let now = NSDate()
        
        if(Int(now.timeIntervalSince1970) - lastActive <= Const.Time_Out_Value) {
            return NSUserDefaults.standardUserDefaults().stringForKey(Const.Bill_Key)!
        }
        return ""
    }
    
    func saveBillAmount(lastBillAmount:String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(lastBillAmount, forKey: Const.Bill_Key)
        
        let date = NSDate()
        let timeSecond = Int(date.timeIntervalSince1970)
        
        defaults.setInteger(timeSecond, forKey: Const.Last_Active_Key)
        
        defaults.synchronize()
    }
    
    /**
     Save the selected theme.
     @param themeId.
     @return void.
     */
    func saveSelectedTheme(themeId:Int) {
        NSUserDefaults.standardUserDefaults().setInteger(themeId, forKey: Const.Theme_Key)
    }
    
    /**
     Load the saved theme.
     @return Saved theme id.
     */
    func loadTheme() -> Int {
        if let _ = NSUserDefaults.standardUserDefaults().objectForKey(Const.Theme_Key) {
            return NSUserDefaults.standardUserDefaults().integerForKey(Const.Theme_Key);
        }
        return Const.Theme_Default_Value
    }

}
