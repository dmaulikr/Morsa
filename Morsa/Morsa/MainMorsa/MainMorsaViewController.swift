//
//  MainMorsaViewController.swift
//  Morsa
//
//  Created by Moxtra on 2017/6/30.
//  Copyright © 2017年 MADAO. All rights reserved.
//

import UIKit
import SnapKit

class MainMorsaViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    private let kCardSizeWidth = 295
    private let kCardSizeHeight = 145
    private let kCardCellReuseIdentifier = "kCardCellReuseIdentifier"
    private let kCodeCellReuseIdentifier = "kCodeCellReuseIdentifier"
    
    private var morsaCollectionView:MSMorsaCardCollectionView!
    private var codeTableView:UITableView!
    
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
            make.top.left.right.equalToSuperview()
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
        codeTableView = UITableView.init(frame: view.frame)
        codeTableView.delegate = self
        codeTableView.dataSource = self
        codeTableView.register(UITableViewCell.self, forCellReuseIdentifier: kCodeCellReuseIdentifier)
        view.addSubview(codeTableView)
        codeTableView.snp.makeConstraints { (make) in
            make.top.equalTo(mailBoxView.snp.bottom).offset(-mailBoxView.borderWidth)
            make.left.equalTo(mailBoxView).offset(mailBoxView.borderWidth)
            make.right.equalTo(mailBoxView).offset( -mailBoxView.borderWidth)
            make.height.equalTo(200)
        }
    }
    
    //MARK: - UICollectionViewDelegate/DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MSMorseCodeManager.getTestCode().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCardCellReuseIdentifier, for: indexPath) as! MSMorsaCardViewCell
        cardCell.morseCode = MSMorseCodeManager.getTestCode()[indexPath.row]
        return cardCell
    }
    
    //MARK: - UITableViewDelegate/DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let codeCell = tableView.dequeueReusableCell(withIdentifier: kCodeCellReuseIdentifier)
        return codeCell!
    }
    
    //MARK: - MorseCodeProcess
    func loadNewCodes(codes:Array<MSMorsaCode>) {
//        MSMorsaCodePlayer.sharedPlayer.playMorsaCode(code: codes.first!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let codes = MSMorseCodeManager.getTestCode()
        MSMorsaCodePlayer.sharedPlayer.playMorsaCodes(codes: codes)
    }
}

