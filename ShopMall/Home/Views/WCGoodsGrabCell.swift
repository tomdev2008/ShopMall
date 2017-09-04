//
//  WCGoodsGrabCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCGoodsGrabCell: UICollectionViewCell {
    
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()

    var collectionView:UICollectionView!
    
    var dataSource:[WCGoodGrabModel] = [WCGoodGrabModel]() {
        
        didSet {
            
            collectionView.reloadData()
        }
    }
    
    let WCGoodsGradDetailCellID = "WCGoodsGradDetailCellID"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: self.bounds.height * 0.65, height: self.bounds.height * 0.9)
        layout.minimumLineSpacing = 1
        
        collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(WCGoodsGradDetailCell.self, forCellWithReuseIdentifier: WCGoodsGradDetailCellID)
        self.contentView.addSubview(collectionView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WCGoodsGrabCell:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WCGoodsGradDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCGoodsGradDetailCellID, for: indexPath) as! WCGoodsGradDetailCell
        cell.model = dataSource[indexPath.row];
        return cell
    }
}
