//
//  MSMorseCardView.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

import SnapKit

class MSMorseCardView: UIView {
    
    var codeText:String? {
        didSet{
            self.codeLabel.text = self.codeText as String?
        }
    }

    private var codeLabel = UILabel.init()
    private var codeScrollView = UIScrollView.init()
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.setupUserInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UserInterfce
    func setupUserInterface() {
        self.backgroundColor = UIColor.red
        
        //Config code scroll view
        self.addSubview(self.codeScrollView)
        self.codeScrollView.backgroundColor = UIColor.blue
        self.codeScrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(50)
        }
        
        //Cofig code text label
        self.codeScrollView.addSubview(self.codeLabel)
        self.codeLabel.sizeToFit()
        self.codeLabel.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        self.codeScrollView.contentSize = self.codeLabel.frame.size
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
