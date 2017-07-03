//
//  MainMorsaViewController.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit
import SnapKit

class MainMorsaViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    private let kCardSizeWidth = 295
    private let kCardSizeHeight = 145
    private let kCardCellReuseIdentifier = "kCardCellReuseIdentifier"
    
    private var morsaCollectionView:MSMorsaCardCollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "#6B92AF")
        self.setupUserInterface()
        let codes = [MSMorsaCode.init(code: "...", character: "S")]
        self.loadNewCodes(codes: codes)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - UserInterface
    
    func setupUserInterface() {
        //Config colleciton view
        let cardLayout = UICollectionViewFlowLayout.init()
        cardLayout.itemSize = CGSize(width:kCardSizeWidth, height:kCardSizeHeight)
        cardLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        cardLayout.sectionInset = UIEdgeInsets(top:5, left:5, bottom:5, right:5)
        
        self.morsaCollectionView = MSMorsaCardCollectionView.init(frame: self.view.frame,
                                   collectionViewLayout: cardLayout)
        self.morsaCollectionView.delegate = self
        self.morsaCollectionView.dataSource = self
        self.morsaCollectionView.clipsToBounds = true
        self.view.addSubview(self.morsaCollectionView)
        self.morsaCollectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        self.morsaCollectionView.register(MSMorsaCardViewCell.self, forCellWithReuseIdentifier: kCardCellReuseIdentifier)
    }
    
    //MARK: - UICollectionViewDelegate/DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCardCellReuseIdentifier, for: indexPath) as! MSMorsaCardViewCell
        switch indexPath.row {
        case 0:
            cardCell.morseCode = MSMorsaCode.init(code: "...", character: "a")
        case 1:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "B")
        case 2:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "C")
        case 3:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "D")
        case 4:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "E")
        case 5:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "F")
        case 6:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "G")
        case 7:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "H")
        case 8:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "I")
        case 9:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "J")
        case 10:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "K")
        case 11:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "L")
        case 12:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "M")
        case 13:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "N")
        case 14:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "O")
        case 15:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "P")
        case 16:
            cardCell.morseCode = MSMorsaCode.init(code: "---", character: "W")
        default:
            cardCell.morseCode = MSMorsaCode.init(code: "..-", character: "Z")
        }
        return cardCell
    }
    
    //MARK: - MorseCodeProcess
    func loadNewCodes(codes:Array<MSMorsaCode>) {
//        MSMorsaCodePlayer.sharedPlayer.playMorsaCode(code: codes.first!)
    }
}

