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
        setupUserInterface()
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
        
        morsaCollectionView = MSMorsaCardCollectionView.init(frame: self.view.frame,
                                   collectionViewLayout: cardLayout)
        morsaCollectionView.delegate = self
        morsaCollectionView.dataSource = self
        morsaCollectionView.clipsToBounds = true
        view.addSubview(self.morsaCollectionView)
        morsaCollectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        self.morsaCollectionView.register(MSMorsaCardViewCell.self, forCellWithReuseIdentifier: kCardCellReuseIdentifier)
        
        //Config mail view 
        let mailBoxView = MSMailboxView.init(frame: CGRect(x:0, y:0, width:view.frame.size.width, height: 30))
        view.addSubview(mailBoxView)
        mailBoxView.snp.makeConstraints { (make) in
            make.top.equalTo(morsaCollectionView.snp.bottom)
            make.left.equalToSuperview().offset(3)
            make.right.equalToSuperview().offset(-3)
            make.height.equalTo(30)
        }
        
        //Config table view
        
    }
    
    //MARK: - UICollectionViewDelegate/DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 26
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCardCellReuseIdentifier, for: indexPath) as! MSMorsaCardViewCell
        cardCell.morseCode = MSMorseCodeManager.sharedManager.morseCodeTable[indexPath.row]
        return cardCell
    }
    
    //MARK: - MorseCodeProcess
    func loadNewCodes(codes:Array<MSMorsaCode>) {
//        MSMorsaCodePlayer.sharedPlayer.playMorsaCode(code: codes.first!)
    }
}

