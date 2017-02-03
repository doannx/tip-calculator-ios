//
//  StorageUtils.swift
//  tippy
//
//  Created by john on 2/3/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import Foundation

private let TIP_KEY = "tipPercent"
private let TIP_DEFAULT_VALUE = 15

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
}
