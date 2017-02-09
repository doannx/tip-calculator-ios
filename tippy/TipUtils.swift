//
//  TipUtils.swift
//  tippy
//
//  Created by john on 2/3/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import Foundation

class TipUtils: NSObject {
    
    enum TIP_PERCENTAGE_ENUM: Double {
        case MIN = 0.15
        case MID = 0.2
        case MAX = 0.25
    }
    
    /**
     Calculate total amount.
     @param billAmount Bill amount.
     @param tipPercent Tip percentage.
     @return Total amount.
     */
    static func calculateTotalAmount(billAmount:Double, tipPercent:Double) -> Double {
        return billAmount + calculateTipAmount(billAmount, tipPercent: tipPercent)
    }
    
    /**
     Calculate tip amount.
     @param billAmount Bill amount.
     @param tipPercent Tip percentage.
     @return Tip amount.
     */
    static func calculateTipAmount(billAmount:Double, tipPercent:Double) -> Double {
        return billAmount * tipPercent
    }
    
    /**
     Get tip value based on index.
     @param tipIndex.
     @return Tip value.
     */
    static func getTipValue(tipIndex:Int) -> Int {
        return Const.Tip_Values[tipIndex] ?? Const.Tip_Values[0]
    }
    
    /**
     Get tip index based on value.
     @param tipValue.
     @return Tip index.
     */
    static func getTipIndex(tipValue:Int) -> Int {
        return Const.Tip_Values.indexOf(tipValue)! ?? 0
    }
    
    /**
     Format currency value by current locale.
     @param amount.
     @return Formatted string.
     */
    static func formatCurrencyByLocalization(amount:Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        
        return formatter.stringFromNumber(amount)!
    }
    
    /**
     Return currency symbol by current locale.
     @return Currency symbol.
     */
    static func getCurrencySymbol() -> String {
        return String(NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol)!)
    }
}
