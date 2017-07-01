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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCardCellReuseIdentifier, for: indexPath)
        return cardCell
    }
    
    //MARK: - MorseCodeProcess
    func loadNewCodes(codes:Array<MSMorsaCode>) {
//        MSMorsaCodePlayer.sharedPlayer.playMorsaCode(code: codes.first!)
    }
}

