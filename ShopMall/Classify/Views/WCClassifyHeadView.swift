//
//  WCClassifyHeadView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/25.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCClassifyHeadView: UICollectionReusableView {
    
    let titleLab:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLab.font = k12Font
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
