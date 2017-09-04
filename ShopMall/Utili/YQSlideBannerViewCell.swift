//
//  YQSlideBannerViewCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/19.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class YQSlideBannerViewCell: UICollectionViewCell {
    
    var imgView:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.lightGray
        imgView = UIImageView.init()
        self.contentView.addSubview(imgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    }
    
}
