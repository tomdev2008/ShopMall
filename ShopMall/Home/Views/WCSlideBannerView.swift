//
//  WCSlideBannerView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/19.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCSlideBannerView: UICollectionReusableView {
    
    var bannerView:YQSlideBannerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        bannerView = YQSlideBannerView.initBannerView(frame: self.bounds, placeholderImage: (UIImage.init(named: "back"))!)
        bannerView.imageUrls = ["slideshow03","slideshow01","slideshow02","slideshow03","slideshow01"]
//        bannerView.delegate = self;
        self.addSubview(bannerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension WCSlideBannerView:YQSlideBannerViewDelegate {
    
    func bannerViewDidSelectItemAtIndex(bannerView: YQSlideBannerView, index: NSInteger) {
        
    }
}
