//
//  MSMorsaCardViewCell.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

class MSMorsaCardViewCell: UICollectionViewCell {
    public var morseCode:MSMorsaCode{
        didSet{
            updateContent()
        }
    }
    private var codeTextLabel:UITextField
    private var characterTextLabel:UILabel
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        codeTextLabel = UITextField.init()
        characterTextLabel = UILabel.init()
        morseCode = MSMorsaCode(code: "...", character: "A")
        super.init(frame: frame)
        setupUserInterface()
        setupShadowLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: - UserInterface
    
    private func setupUserInterface() {
        backgroundColor = UIColor.init(colorLiteralRed: 0xfe, green: 0x0d, blue: 0xdc, alpha: 1)
        codeTextLabel.isUserInteractionEnabled = false
        codeTextLabel.text = "..."
        codeTextLabel.textColor = UIColor.white
        codeTextLabel.font = UIFont.init(name: MSFont, size: 80)
        codeTextLabel.textAlignment = NSTextAlignment.center
        contentView.addSubview(codeTextLabel)
        codeTextLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-10)
            make.left.right.equalTo(contentView)
            make.height.equalTo(contentView.snp.height).dividedBy(3.3)
        }
        
        characterTextLabel = UILabel.init()
        characterTextLabel.text = "S"
        characterTextLabel.textColor = UIColor.white
        characterTextLabel.textAlignment = NSTextAlignment.center
        characterTextLabel.font = UIFont.init(name: MSFont, size: 80)
        contentView .addSubview(characterTextLabel)
        characterTextLabel.snp.makeConstraints { (make) in
            make.width.right.equalTo(codeTextLabel)
            make.bottom.equalToSuperview()
            make.top.equalTo(codeTextLabel.snp.bottom).offset(10.0)
        }
    }
    
    private func updateContent() {
        codeTextLabel.text = morseCode.code
        characterTextLabel.text = morseCode.character
        layer.backgroundColor = UIColor.getMDColorWithText(text: morseCode.character).cgColor
    }
    
    private func setupShadowLayer() {
        let shadowPath = UIBezierPath.init(roundedRect: bounds, cornerRadius: 7)
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = 7
        layer.shadowPath = shadowPath.cgPath
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowOpacity = 0.5
    }
    
}
