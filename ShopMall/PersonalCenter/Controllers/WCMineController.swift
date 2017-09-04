//
//  WCMineController.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/10.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCMineController: WCBaseController {

    let flowCellID:String = "flowCellID"
    let entertainmentCellID:String = "entertainmentCellID"
    let hotRecommendCellID:String = "hotRecommendCellID"
    
    let flowHeadViewID:String = "flowHeadViewID"
    let hotRecommendHeadID:String = "hotRecommendHeadID"
    let flowFootViewID:String = "flowFootViewID"
    let hotFootViewID:String = "hotFootViewID"
    
    lazy var collectionView:UICollectionView = {
    
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let collectionView:UICollectionView = UICollectionView.init(frame: .init(x: 0, y: 64, width: kScreenW, height: kScreenH - 113), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    var buyItems:NSMutableArray = NSMutableArray()
    var entertains:NSMutableArray = NSMutableArray()
    var hotItems:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        collectionView.register(WCMineFlowCell.self, forCellWithReuseIdentifier: flowCellID)
        collectionView.register(WCHomeTenGridsCell.self, forCellWithReuseIdentifier: entertainmentCellID)
        collectionView.register(WCMineHotRecommendCell.self, forCellWithReuseIdentifier: hotRecommendCellID)
        
        collectionView.register(WCMineHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: flowHeadViewID)
        collectionView.register(WCBrandHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: hotRecommendHeadID)
        collectionView.register(WCMineFootView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: flowFootViewID)
         collectionView.register(WCHotRecomFootView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: hotFootViewID)
        self.view.addSubview(collectionView)
        
        getDatas()
    }
    
    func getDatas() -> Void {
        
        buyItems = WCMineFlowModel.mj_objectArray(withFilename: "MyBuyFlow.plist")
        entertains = WCMineFlowModel.mj_objectArray(withFilename: "MyRecreationFlow.plist")
        hotItems = WCGoodGrabModel.mj_objectArray(withFilename: "YouLikeGoods.plist")
        collectionView.reloadData()
    }
}

extension WCMineController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section == 0 || section == 1) ? 5 : (section == 2) ? 8 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return (section == 0) ? CGSize.init(width: kScreenW, height: 220) : (section == 3) ? CGSize.init(width: kScreenW, height: 40) : CGSize.init(width: 0.0, height: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return (section == 3) ? CGSize.init(width: kScreenW, height: 40) : CGSize.init(width: kScreenW, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (section == 3) ? 4 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (section == 3) ? 4 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 || indexPath.section == 1 {
            return CGSize.init(width: kScreenW / 5, height: 60)
        }
        
        if indexPath.section == 2 {
            return CGSize.init(width: kScreenW / 4.0, height: 60)
        }
        
        if indexPath.section == 3 {
            return CGSize.init(width: (kScreenW - 4) / 2, height: (kScreenW - 4)/2 + 40.0)
        }
        
        return CGSize.init(width: 0.0, height: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseView:UICollectionReusableView = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader {
            if indexPath.section == 0 {
                let topView:WCMineHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: flowHeadViewID, for: indexPath) as! WCMineHeadView
                return topView
            }
            
            if indexPath.section == 3 {
                let brandHeadView:WCBrandHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: hotRecommendHeadID, for: indexPath) as! WCBrandHeadView
                brandHeadView.backgroundColor = RGBA(r: 245, g: 245, b: 245, a: 1.0)
                brandHeadView.brandBtn.setTitle("热门精选", for: .normal)
                brandHeadView.brandBtn.setTitleColor(UIColor.flatBlue(), for: .normal)
                brandHeadView.brandBtn.setImage(UIImage.init(named: "shouye_icon02"), for: .normal)
                return brandHeadView
            }
        }
        
        if kind == UICollectionElementKindSectionFooter {
            if indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2 {
                let  footView:WCMineFootView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: flowFootViewID, for: indexPath) as! WCMineFootView
                return footView
            }
            
            if indexPath.section == 3 {
                let  hotFootView:WCHotRecomFootView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: hotFootViewID, for: indexPath) as! WCHotRecomFootView
                return hotFootView
            }
        }
        return reuseView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WCMineFlowCell = collectionView.dequeueReusableCell(withReuseIdentifier: flowCellID, for: indexPath) as! WCMineFlowCell
        let titles:NSArray = ["账户余额","优惠券","美豆","美通卡", "我的金融"]
        if indexPath.section == 0 {
            let cell:WCMineFlowCell = collectionView.dequeueReusableCell(withReuseIdentifier: flowCellID, for: indexPath) as! WCMineFlowCell
            cell.type = .WCMineFlowCellTypeImage
            if buyItems.count != 0 {cell.model = buyItems[indexPath.row] as! WCMineFlowModel}
            return cell
        }
        else if indexPath.section == 1 {
            let cell:WCMineFlowCell = collectionView.dequeueReusableCell(withReuseIdentifier: flowCellID, for: indexPath) as! WCMineFlowCell
            cell.type = .WCMineFlowCellTypeLabel
            if indexPath.row == titles.count - 1 {
                cell.isLastItem = true
                cell.imageV.image = UIImage.init(named: "wodejingrong")
            }
            else {
                cell.isLastItem = false
                cell.detailLab.text = "0";
            }
            cell.titleLab.text = titles[indexPath.row] as? String
            return cell
        }
        else if indexPath.section == 2 {
            let cell:WCMineFlowCell = collectionView.dequeueReusableCell(withReuseIdentifier: flowCellID, for: indexPath) as! WCMineFlowCell
            cell.type = .WCMineFlowCellTypeImage
            cell.model = entertains[indexPath.row] as! WCMineFlowModel
            return cell
        }
        else if indexPath.section == 3 {
            
            let cell:WCMineHotRecommendCell = collectionView.dequeueReusableCell(withReuseIdentifier: hotRecommendCellID, for: indexPath) as! WCMineHotRecommendCell
            cell.model = hotItems[indexPath.row] as! WCGoodGrabModel
            return cell
        }
        return cell
    }
}
