//
//  WCSummerFootView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCSummerFootView: UICollectionReusableView {
    
    var bannerView:YQSlideBannerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bannerView = YQSlideBannerView.initBannerView(frame: self.bounds, placeholderImage: (UIImage.init(named: "back"))!)
        bannerView.imageUrls = ["http://gfs4.gomein.net.cn/T1DZAvBQbg1RCvBVdK.jpg","http://gfs9.gomein.net.cn/T1CoJvBXV_1RCvBVdK.jpg","http://gfs3.gomein.net.cn/T1C.EvBjJ_1RCvBVdK.jpg"]
        //        bannerView.delegate = self;
        self.addSubview(bannerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
