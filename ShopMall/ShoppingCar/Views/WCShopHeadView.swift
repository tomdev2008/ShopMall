//
//  WCShopHeadView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/26.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCShopHeadView: UIView {
    
    let titleLab:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLab.text = "大家都在买"
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
