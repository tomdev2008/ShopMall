//
//  WCHotRecomFootView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/25.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCHotRecomFootView: UICollectionReusableView {
    
    var overLab:UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        overLab.text = "看完了，下次再逛吧"
        overLab.textAlignment = .center
        overLab.textColor = UIColor.darkGray
        overLab.font = k16Font
        self.addSubview(overLab)
        
        overLab.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
