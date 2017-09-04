//
//  WCSummerCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCSummerCell: UICollectionViewCell {
    
    var dataSource:NSArray = NSArray() {
        
        didSet {
            
            headImageView.kf.setImage(with: URL(string: dataSource[0] as! String))
            collectionView.reloadData()
        }
    }
    
    let WCSummerCellDetailID = "WCSummerCellDetailID"
    
    var headImageView:UIImageView!

    var collectionView:UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headImageView = UIImageView.init(frame: .init(x: 0, y: 0, width: kScreenW, height: kScreenW * 0.35))
        self.addSubview(headImageView)
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize.init(width: 100, height: 100)
        collectionView = UICollectionView.init(frame: .init(x: 0, y: headImageView.frame.maxY, width: kScreenW, height: self.bounds.height - headImageView.bounds.height), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(WCSummerDetailCell.self, forCellWithReuseIdentifier: WCSummerCellDetailID)
        self.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WCSummerCell:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WCSummerDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCSummerCellDetailID, for: indexPath) as! WCSummerDetailCell
        cell.contentImageView.kf.setImage(with: URL(string: dataSource[indexPath.row] as! String))
        return cell
    }
}
