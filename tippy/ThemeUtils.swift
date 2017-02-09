//
//  ThemeUtils.swift
//  tippy
//
//  Created by john on 2/4/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import Foundation

class ThemeUtils: NSObject {

    /**
     Get theme name based on index.
     @param themeId.
     @return Theme Name.
     */
    static func getThemeName(themeId:Int) -> String {
        return Const.Theme_Values[themeId] ?? Const.Theme_Values[0]
    }
    
    /**
     Get theme id based on name.
     @param themeName.
     @return Theme Id.
     */
    static func getThemeId(themeName:String) -> Int {
        return Const.Theme_Values.indexOf(themeName)! ?? 0
    }
    
}