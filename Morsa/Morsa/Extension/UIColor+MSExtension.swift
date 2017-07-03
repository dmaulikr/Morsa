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
        UIColor.hexStringToUIColor(hex: "C8E6C9"),
        UIColor.hexStringToUIColor(hex: "A5D6A7"),
        UIColor.hexStringToUIColor(hex: "81C784"),
        UIColor.hexStringToUIColor(hex: "66BB6A"),
        UIColor.hexStringToUIColor(hex: "4CAF50"),
        UIColor.hexStringToUIColor(hex: "43A047"),
        UIColor.hexStringToUIColor(hex: "AFB42B"),
        UIColor.hexStringToUIColor(hex: "C0CA33"),
        UIColor.hexStringToUIColor(hex: "CDDC39"),
        UIColor.hexStringToUIColor(hex: "D4E157"),
        UIColor.hexStringToUIColor(hex: "DCE775"),
        UIColor.hexStringToUIColor(hex: "E6EE9C"),
        UIColor.hexStringToUIColor(hex: "FFF59D"),
        UIColor.hexStringToUIColor(hex: "FFF176"),
        UIColor.hexStringToUIColor(hex: "FFEE58"),
        UIColor.hexStringToUIColor(hex: "FFFB3B"),
        UIColor.hexStringToUIColor(hex: "FDD835"),
        UIColor.hexStringToUIColor(hex: "FBC02D"),
        UIColor.hexStringToUIColor(hex: "FFA726"),
        UIColor.hexStringToUIColor(hex: "FF9800"),
        UIColor.hexStringToUIColor(hex: "FB8C00"),
        UIColor.hexStringToUIColor(hex: "F57C00"),
        UIColor.hexStringToUIColor(hex: "EF6C00"),
        UIColor.hexStringToUIColor(hex: "E65100"),
        UIColor.hexStringToUIColor(hex: "BF360C"),
        UIColor.hexStringToUIColor(hex: "D84315"),
        UIColor.hexStringToUIColor(hex: "E64A19"),
        UIColor.hexStringToUIColor(hex: "F4511E"),
        UIColor.hexStringToUIColor(hex: "FF5722"),
        UIColor.hexStringToUIColor(hex: "FF7043"),
        UIColor.hexStringToUIColor(hex: "FF8A65"),
        UIColor.hexStringToUIColor(hex: "FFAB91"),
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

