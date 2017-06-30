//
//  MSMorsaCardViewCell.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

class MSMorsaCardViewCell: UICollectionViewCell {
    
    private var codeTextLabel:UILabel
    private var characterTextLabel:UILabel
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        codeTextLabel = UILabel.init()
        characterTextLabel = UILabel.init()
        super.init(frame: frame)
        setupUserInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowPath = shadowPath.cgPath
    }
    
    //MARK: - UserInterface
    private func setupUserInterface() -> Void {
        backgroundColor = UIColor.init(colorLiteralRed: 0xfe, green: 0x0d, blue: 0xdc, alpha: 1)
        codeTextLabel = UILabel.init()
        codeTextLabel.text = "..."
        codeTextLabel.font = UIFont.systemFont(ofSize: 40)
        codeTextLabel.textAlignment = NSTextAlignment.center
        contentView.addSubview(codeTextLabel)
        codeTextLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(contentView.snp.height).dividedBy(2)
        }
        
        characterTextLabel = UILabel.init()
        characterTextLabel.text = "S"
        characterTextLabel.textAlignment = NSTextAlignment.center
        characterTextLabel.font = UIFont.systemFont(ofSize: 80)
        contentView .addSubview(characterTextLabel)
        characterTextLabel.snp.makeConstraints { (make) in
            make.width.height.right.equalTo(codeTextLabel)
            make.top.equalTo(codeTextLabel.snp.bottom)
        }
    }
    
}
