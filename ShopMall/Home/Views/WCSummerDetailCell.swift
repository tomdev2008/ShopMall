//
//  WCSummerDetailCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCSummerDetailCell: UICollectionViewCell {
    
    var contentImageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentImageView = UIImageView.init(frame: .init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        contentImageView.contentMode = .scaleToFill
        self.addSubview(contentImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
