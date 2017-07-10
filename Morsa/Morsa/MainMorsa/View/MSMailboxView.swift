//
//  MSMailboxView.swift
//  Morsa
//
//  Created by 胡翔 on 2017/7/2.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

class MSMailboxView: UIView {
    var borderWidth:Float {
        get {
            return Float((bounds.size.height -  CGFloat(2 * entranceHeight))/2.0)
        }
    }
    let entranceHeight:Int = 3

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUserInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        super.updateConstraints()
    }

    private func setupUserInterface() {
        layer.borderWidth = (bounds.size.height -  CGFloat(2 * entranceHeight))/2.0
        let shadowPath = UIBezierPath.init(roundedRect: bounds, cornerRadius: 7)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowOpacity = 0.5
        
        layer.borderColor = UIColor.hexStringToUIColor(hex: "9BA4AA").cgColor
        layer.cornerRadius = 7
        layer.backgroundColor = UIColor.hexStringToUIColor(hex: "6F6161").cgColor
    }
}
