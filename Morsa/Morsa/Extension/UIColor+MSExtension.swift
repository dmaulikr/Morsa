//
//  UIColor+MSExtension.swift
//  Morsa
//
//  Created by 胡翔 on 2017/7/1.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let mdColors = [
        UIColor.hexStringToUIColor(hex: "aed581"),
        UIColor.hexStringToUIColor(hex: "9ccc65"),
        UIColor.hexStringToUIColor(hex: "8bc34a"),
        UIColor.hexStringToUIColor(hex: "7cb342"),
        UIColor.hexStringToUIColor(hex: "689f38"),
        UIColor.hexStringToUIColor(hex: "558b2f"),
        UIColor.hexStringToUIColor(hex: "33691e"),
        UIColor.hexStringToUIColor(hex: "ccff90"),
        UIColor.hexStringToUIColor(hex: "c0ca33"),
        UIColor.hexStringToUIColor(hex: "cddc39"),
        UIColor.hexStringToUIColor(hex: "fdd835"),
        UIColor.hexStringToUIColor(hex: "fbc02d"),
        UIColor.hexStringToUIColor(hex: "f9a825"),
        UIColor.hexStringToUIColor(hex: "f57f17"),
        UIColor.hexStringToUIColor(hex: "ffa000"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
        UIColor.hexStringToUIColor(hex: "ff8f00"),
    ]
    

    class func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func getMDColorWithText(text:String) -> UIColor {
        let checkedString = checkText(str: text.uppercased())!
        let ascii = String(describing: checkedString).unicodeScalars
        let asciiCode = Int(ascii[ascii.startIndex].value)
        return mdColors[asciiCode-65]
    }
    
    private class func checkText(str: String) -> String? {
        let pattern = "[a-zA-Z]"
        if let range = str.range(of:pattern, options: .regularExpression) {
            let result = str.substring(with:range)
            return result
        }
        return nil
    }
}

