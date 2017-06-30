//
//  MSMorsaCode.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

class MSMorsaCode: NSObject {
    var code:String!
    var character:String!
    
    init(code:String!, character:String!) {
        super.init()
        self.code = code
        self.character = character
    }
}
