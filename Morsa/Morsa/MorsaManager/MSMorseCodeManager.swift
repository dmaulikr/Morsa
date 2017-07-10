//
//  MSMorseCodeManager.swift
//  Morsa
//
//  Created by 胡翔 on 2017/7/3.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

class MSMorseCodeManager: NSObject {
    class var codeAndStringTable:Dictionary<String, String> {
        get {
            return [
                "A":"·-","B":"·-","C":"·-","D":"·-",
                "E":"·-","F":"·-","G":"·-","H":"·-",
                "I":"·-","J":"·-","K":"·-","L":"·-",
                "M":"·-","N":"·-","O":"---","P":"·-",
                "Q":"·-","R":"·-","S":"···","T":"·-",
                "U":"·-","V":"·-","W":"·-","X":"·-",
                "Y":"·-","Z":"·-","0":"·-","1":"·-",
                "2":"·-","3":"·-","4":"·-","5":"·-"
            ]
        }
    }
    
    private let tableCount = 36
    
    public let morseCodeTable:Array<MSMorsaCode>
    //MARK: - Singelton
    static let sharedManager = MSMorseCodeManager()
    
    override init() {
        
        var mutableMorseTable = Array<MSMorsaCode>()
        for index in 0...tableCount {
            mutableMorseTable.append(MSMorseCodeManager.getMorseCodeWithIndex(index: index))
        }
        morseCodeTable = mutableMorseTable
        super.init()
    }
    
    class func getMorseCodeWithIndex(index: Int) -> MSMorsaCode {
        let character = String(describing: UnicodeScalar(index + 65)!)
        let code = MSMorseCodeManager.getMorseCodeWithString(string: character)
        return code
    }
    
    class func getMorseCodeWithString(string: String) -> MSMorsaCode {
        let ascii = String(describing: string.uppercased()).unicodeScalars
        let asciiCode = Int(ascii[ascii.startIndex].value)
        let code = MSMorseCodeManager.codeAndStringTable[string.uppercased()]
        let morseCode = MSMorsaCode.init(code:code, character: String(describing: UnicodeScalar(asciiCode)!))
        return morseCode
    }
    
    class func getTestCode() -> Array<MSMorsaCode> {
        return [
                getMorseCodeWithString(string: "S"),
                getMorseCodeWithString(string: "O"),
                getMorseCodeWithString(string: "S")
        ]
    }
}
