//
//  WCClassifyController.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/10.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCClassifyController: WCBaseController {

    var titleItems:NSMutableArray = NSMutableArray()
    var detailItems:NSMutableArray = [WCClasssifyDetailModel]() as! NSMutableArray
    
    let WCGoodsCellID:String = "WCGoodsCellID"
    let WCBrandCellID:String = "WCBrandCellID"
    
    let WCHeadViewID:String = "WCHeadViewID"
    
    lazy var tableView:UITableView = {
    
        let tableView:UITableView = UITableView.init(frame: .init(x: 0, y: 64, width: 100, height: kScreenH - 113), style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WCClassifyCategoryCell.self, forCellReuseIdentifier: "titleCell")
        return tableView
    }()
    
    lazy var collectionView:UICollectionView = {
    
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 3
        let collectionView:UICollectionView = UICollectionView.init(frame: .init(x: 100, y: 64, width: kScreenW - 100, height: kScreenH - 113), collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(tableView)
        
        collectionView.register(WCClassifyGoodsCell.self, forCellWithReuseIdentifier: WCGoodsCellID)
        collectionView.register(WCClassifyBrandsCell.self, forCellWithReuseIdentifier: WCBrandCellID)
        collectionView.register(WCClassifyHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: WCHeadViewID)
        self.view.addSubview(collectionView)
        
        getDatas()
    }
    
    func getDatas() -> Void {
        
        titleItems = WCClassifyCategoryModel.mj_objectArray(withFilename: "ClassifyTitles.plist")
        detailItems = WCClasssifyDetailModel.mj_objectArray(withFilename: "ClassiftyGoods01.plist")
        tableView.reloadData()
        tableView.selectRow(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: .top)
    }
}

extension WCClassifyController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WCClassifyCategoryCell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! WCClassifyCategoryCell
        cell.selectionStyle = .none
        let model:WCClassifyCategoryModel = titleItems[indexPath.row] as! WCClassifyCategoryModel
        cell.titleLab.text = model.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model:WCClassifyCategoryModel = titleItems[indexPath.row] as! WCClassifyCategoryModel
        detailItems = WCClasssifyDetailModel.mj_objectArray(withFilename: model.fileName)
        collectionView.reloadData()
    }
}

extension WCClassifyController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let model:WCClasssifyDetailModel = detailItems[section] as! WCClasssifyDetailModel
        return model.goods!.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return detailItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: kScreenW, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section != detailItems.count - 1 {
            return CGSize.init(width: (kScreenW - 106) / 3, height: (kScreenW - 106)/3 + 20)
        }
        else {
            return CGSize.init(width: (kScreenW - 106) / 3, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reuseView:UICollectionReusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader {
            let headView:WCClassifyHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCHeadViewID, for: indexPath) as! WCClassifyHeadView
            let model:WCClasssifyDetailModel = detailItems[indexPath.section] as! WCClasssifyDetailModel
            headView.titleLab.text = model.title
            return headView
        }
        return reuseView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section != detailItems.count - 1 {
            let cell:WCClassifyGoodsCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCGoodsCellID, for: indexPath) as! WCClassifyGoodsCell
            let model:WCClasssifyDetailModel = detailItems[indexPath.section] as! WCClasssifyDetailModel
            let subModel:NSDictionary = model.goods?[indexPath.row] as! NSDictionary
            cell.model = subModel
            return cell
        }
        else {
            let cell:WCClassifyBrandsCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCBrandCellID, for: indexPath) as! WCClassifyBrandsCell
            let model:WCClasssifyDetailModel = detailItems[indexPath.section] as! WCClasssifyDetailModel
            let subModel:NSDictionary = model.goods?[indexPath.row] as! NSDictionary
            cell.model = subModel
            return cell
        }
    }
}
