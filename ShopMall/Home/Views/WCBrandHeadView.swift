//
//  WCBrandHeadView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCBrandHeadView: UICollectionReusableView {
    
    var brandBtn:UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        brandBtn = UIButton.init(type: .custom)
        brandBtn.titleLabel?.font = k13Font
        brandBtn.setTitleColor(RGBA(r: 77, g: 171, b: 21, a: 1.0), for: .normal)
        self.addSubview(brandBtn)
        
        brandBtn.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
