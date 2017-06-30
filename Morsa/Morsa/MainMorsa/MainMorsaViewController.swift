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
    
    private var morsaCollectionView:UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUserInterface()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UserInterface
    
    func setupUserInterface() {
        self.morsaCollectionView = UICollectionView.init(frame: self.view.frame,
                                   collectionViewLayout: UICollectionViewLayout.init())
        self.morsaCollectionView.delegate = self
        self.morsaCollectionView.dataSource = self
        self.view.addSubview(self.morsaCollectionView)
        self.morsaCollectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(375)
        }
        
        self.morsaCollectionView.register(MSMorsaCardViewCell, forCellWithReuseIdentifier: "1111")
    }
    
    //MARK: - UICollectionViewDelegate/DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "1111", for: indexPath)
        return cardCell
    }
}

