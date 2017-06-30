//
//  MSMorsaCardViewCell.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit

class MSMorsaCardViewCell: UICollectionViewCell {
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UserInterface
    private func setupUserInterface() -> Void {
        self.backgroundColor = UIColor.red
    }
    
}
