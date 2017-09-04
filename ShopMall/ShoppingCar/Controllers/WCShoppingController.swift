//
//  WCShoppingController.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/10.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCShoppingController: WCBaseController {

    let emptyCard:WCShoppingCardEmptyView = WCShoppingCardEmptyView.init(frame: .init(x: 0, y: 64, width: kScreenW, height: kScreenH - 303))
    
    lazy var headView:WCShopHeadView = { [unowned self] in
        
        let headView:WCShopHeadView = WCShopHeadView.init(frame: .init(x: 0, y: self.emptyCard.frame.maxY, width: kScreenW, height: 40))
        return headView
    }()
    
    lazy var collectionView:UICollectionView = { [unowned self] in
    
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 100, height: 150)
        layout.scrollDirection = .horizontal
        let collectionView:UICollectionView = UICollectionView.init(frame: .init(x: 0, y: self.headView.frame.maxY, width: kScreenW, height: 150), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    var dataSource:NSMutableArray = NSMutableArray()
    
    let kShopCardCellID:String = "ShopCardCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emptyCard.backgroundColor = RGBA(r: 245, g: 245, b: 245, a: 1.0)
        self.view.addSubview(emptyCard)
        
        self.view.addSubview(headView)

        collectionView.register(WCShoppingCardCell.self, forCellWithReuseIdentifier: kShopCardCellID)
        self.view.addSubview(collectionView)
        
        getDatas()
    }
    
    func getDatas() -> Void {
        
        dataSource = WCGoodGrabModel.mj_objectArray(withFilename: "RecommendShop.plist")
        collectionView.reloadData()
    }
}

extension WCShoppingController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WCShoppingCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: kShopCardCellID, for: indexPath) as! WCShoppingCardCell
        cell.model = dataSource[indexPath.row] as! WCGoodGrabModel
        return cell
    }
}
