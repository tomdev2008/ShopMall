//
//  WCBrandCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCBrandCell: UICollectionViewCell {
    
    var contentImageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentImageView = UIImageView.init()
        contentImageView.contentMode = .scaleToFill
        self.addSubview(contentImageView)
        
        contentImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
