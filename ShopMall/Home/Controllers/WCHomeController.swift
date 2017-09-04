//
//  WCHomeController.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/10.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCHomeController: WCBaseController {

    let margin:CGFloat = 10.0
    var gridItems:NSMutableArray = NSMutableArray()
    var goodGrads:NSMutableArray?
    var hotRecommend:NSMutableArray?
    
    
    let WCTenGridsCellID:String = "WCTenGridsCell"
    let WCGoodsGradCellID:String = "WCGoodsGradCellID"
    let WCSummerCellID:String = "WCSummerCellID"
    let WCBrandCellID:String = "WCBrandCellID"
    let WCHotRecommendCellID:String = "WCHotRecommendCellID"
    
    
    let WCTenGridsHeadID:String = "WCTenGridsHeadID"
    let WCTimeHeadViewID:String = "WCTimeHeadViewID"
    let WCBrandHeadViewID:String = "WCBrandHeadViewID"
    let WCHotRecommendID:String = "WCHotRecommendID"
    
    let WCTenGridsFootID:String = "WCTenGridsFootID"
    let WCSummerFootID:String = "WCSummerFootID"
    let WCHotRecomFootID:String = "WCHotRecomFootID"
    
    
    lazy var collectionView:UICollectionView = {
    
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let collectionView:UICollectionView = UICollectionView.init(frame: .init(x: 0, y: 0, width: kScreenW, height: kScreenH), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    lazy var backBtn:UIButton = {
        
        let btn:UIButton = UIButton.init(type: UIButtonType.custom)
        btn.setImage(UIImage.init(named: "btn_UpToTop"), for: .normal)
        btn.frame = CGRect.init(x: kScreenW - 50, y: kScreenH - 110, width: 40, height: 40)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(WCHomeController.backClick(btn:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
        self.view.addSubview(backBtn)
        collectionView.register(WCHomeTenGridsCell.self, forCellWithReuseIdentifier: WCTenGridsCellID)
        collectionView.register(WCGoodsGrabCell.self, forCellWithReuseIdentifier: WCGoodsGradCellID)
        collectionView.register(WCSummerCell.self, forCellWithReuseIdentifier: WCSummerCellID)
        collectionView.register(WCBrandCell.self, forCellWithReuseIdentifier: WCBrandCellID)
        collectionView.register(WCHotRecommendCell.self, forCellWithReuseIdentifier: WCHotRecommendCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.register(WCSlideBannerView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: WCTenGridsHeadID)
        collectionView.register(WCHomeTimeHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: WCTimeHeadViewID)
        collectionView.register(WCBrandHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: WCBrandHeadViewID)
        collectionView.register(WCBrandHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: WCHotRecommendID)
        
        collectionView.register(WCHomeTenGridsFootView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: WCTenGridsFootID)
        collectionView.register(WCSummerFootView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: WCSummerFootID)
        collectionView.register(WCHotRecomFootView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: WCHotRecomFootID)
        
        getDatas()
    }
    
    func getDatas() -> Void {
        
        gridItems = WCHomeGridModel.mj_objectArray(withFilename: "GoodsGrid.plist")
        let countDowns:NSArray = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "CountDownShop.plist", ofType: nil)!)!
        goodGrads = WCGoodGrabModel.mj_objectArray(withKeyValuesArray: countDowns)
        hotRecommend = WCGoodGrabModel.mj_objectArray(withFilename: "HomeHighGoods.plist")
        collectionView.reloadData()
    }
    
    func backClick(btn:UIButton) -> Void {
        
        collectionView.scrollRectToVisible(CGRect.init(x: 0, y: 0, width: 1, height: 1), animated: true)
    }
}

extension WCHomeController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        backBtn.isHidden = scrollView.contentOffset.y >= kScreenH ? false : true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return gridItems.count
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return GoodsHandheldImagesArray.count
        default:
            return (hotRecommend?.count)!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize.init(width: kScreenW, height: 150)
        }
        
        if section == 1 || section == 3 || section == 4 {
            return CGSize.init(width: kScreenW, height: 40)
        }
        
        return CGSize.init(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize.init(width: kScreenW, height: 40)
        }
        
        if section == 2 {
            return CGSize.init(width: kScreenW, height: 80)
        }
        
        if section == 4 {
            return CGSize.init(width: kScreenW, height: 40)
        }
        
        return CGSize.init(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize.init(width: kScreenW / 5.0, height: kScreenW / 5.0 + margin + 10)
        case 1:
            return CGSize.init(width: kScreenW, height: 150)
        case 2:
            return CGSize.init(width: kScreenW, height: kScreenW * 0.35 + 120)
        case 3:
            return self.layoutAttributesForItemAtIndexPath(indexPath: indexPath as NSIndexPath).size
        default:
            return CGSize.init(width: (kScreenW - 4) / 2, height: (kScreenW - 4)/2 + 20)
        }
    }
    
    func layoutAttributesForItemAtIndexPath(indexPath:NSIndexPath) -> UICollectionViewLayoutAttributes {
        
        let layoutAttributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath as IndexPath)
        if indexPath.section == 3 {
            if indexPath.row == 0 {
                layoutAttributes.size = CGSize.init(width: kScreenW, height: kScreenW * 0.35)
            }
            else if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 {
                
                layoutAttributes.size = CGSize.init(width: kScreenW * 0.5, height: kScreenW * 0.2)
            }
            else {
                
                layoutAttributes.size = CGSize.init(width: kScreenW * 0.25, height: kScreenW * 0.3)
            }
        }
        return layoutAttributes
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reuseView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader {
            // 顶部banner
            if indexPath.section == 0 {
                let gridHeadView:WCSlideBannerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCTenGridsHeadID, for: indexPath) as! WCSlideBannerView
                return gridHeadView
            }
            // 6点场
            if indexPath.section == 1 {
                let timeHeadView:WCHomeTimeHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCTimeHeadViewID, for: indexPath) as! WCHomeTimeHeadView
                return timeHeadView
            }
            
            // 品牌精选
            if indexPath.section == 3 {
                let brandHeadView:WCBrandHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCBrandHeadViewID, for: indexPath) as! WCBrandHeadView
                brandHeadView.brandBtn.setTitle("品牌精选", for: .normal)
                brandHeadView.brandBtn.setTitleColor(RGBA(r: 77, g: 171, b: 21, a: 1.0), for: .normal)
                brandHeadView.brandBtn.setImage(UIImage.init(named: "shouye_icon03"), for: .normal)
                return brandHeadView
            }
            
            // 热门精选
            if indexPath.section == 4 {
                let brandHeadView:WCBrandHeadView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCHotRecommendID, for: indexPath) as! WCBrandHeadView
                brandHeadView.brandBtn.setTitle("热门精选", for: .normal)
                brandHeadView.brandBtn.setTitleColor(RGBA(r: 77, g: 171, b: 21, a: 1.0), for: .normal)
                brandHeadView.brandBtn.setImage(UIImage.init(named: "shouye_icon02"), for: .normal)
                return brandHeadView
            }
        }
        
        if kind == UICollectionElementKindSectionFooter {
            //
            if indexPath.section == 0 {
                let gridFootView: WCHomeTenGridsFootView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCTenGridsFootID, for: indexPath) as! WCHomeTenGridsFootView
                return gridFootView
            }
            
            // 夏日清凉大排档
            if indexPath.section == 2 {
                let scrollBanner:WCSummerFootView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCSummerFootID, for: indexPath) as! WCSummerFootView
                return scrollBanner
            }
            
            // 热门推荐
            if indexPath.section == 4 {
                let hotFootView:WCHotRecomFootView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WCHotRecomFootID, for: indexPath) as!WCHotRecomFootView
                return hotFootView
            }
        }
        return reuseView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        switch indexPath.section {
        case 0:
            // 10个小菜单
            let cell:WCHomeTenGridsCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCTenGridsCellID, for: indexPath) as! WCHomeTenGridsCell
            cell.model = gridItems[indexPath.row] as! WCHomeGridModel;
            return cell
        case 1:
            // 6点场
            let cell:WCGoodsGrabCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCGoodsGradCellID, for: indexPath) as! WCGoodsGrabCell
            cell.dataSource = goodGrads as! [WCGoodGrabModel]
            return cell
            
        case 2:
            // 夏日清凉大排档
            let cell:WCSummerCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCSummerCellID, for: indexPath) as! WCSummerCell
            cell.dataSource = GoodsRecommendArray
            return cell
        case 3:
            // 品牌精选
            let cell:WCBrandCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCBrandCellID, for: indexPath) as! WCBrandCell
            cell.contentImageView.kf.setImage(with: URL(string: GoodsHandheldImagesArray[indexPath.row] as! String))
            return cell
        case 4:
            // 热门推荐
            let hotCell:WCHotRecommendCell = collectionView.dequeueReusableCell(withReuseIdentifier: WCHotRecommendCellID, for: indexPath) as! WCHotRecommendCell
            hotCell.model = hotRecommend?[indexPath.row] as! WCGoodGrabModel
            return hotCell
        default:
            //
            break
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
