//
//  MSMorseCodeManager.swift
//  Morsa
//
//  Created by 胡翔 on 2017/7/3.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

class MSMorseCodeManager: NSObject {
    private let tableCount = 36
    
    public let morseCodeTable:Array<MSMorsaCode>
    //MARK: - Singelton
    static let sharedManager = MSMorseCodeManager()
    
    override init() {
        
        var mutableMorseTable = Array<MSMorsaCode>()
        for index in 0...tableCount {
            mutableMorseTable.append(MSMorsaCode.getMorseCodeWithIndex(index: index))
        }
        morseCodeTable = mutableMorseTable
        
        super.init()
    }

}
