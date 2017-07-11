//
//  MSMorsaCode.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

enum MSMorsaCodeType {
    case Dot
    case Line
}

class MSMorsaCode: NSObject {
    var code:String
    var character:String
    var codeType:MSMorsaCodeType{
        get{
            return code == "-" ? MSMorsaCodeType.Line : MSMorsaCodeType.Dot
        }
    }
    
    override var description: String {
        return self.character
    }
    
    init(code:String!, character:String!) {
        self.code = code
        self.character = character
        super.init()
    }
}
