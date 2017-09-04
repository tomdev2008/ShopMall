//
//  WCClassifyBrandsCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/25.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCClassifyBrandsCell: UICollectionViewCell {
    
    let imagV:UIImageView = UIImageView()
    
    var model:NSDictionary = NSDictionary() {
        
        didSet {
            
            imagV.kf.setImage(with: URL(string: model["image_url"] as! String))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = RGBA(r: 245, g: 245, b: 245, a: 1.0)
        imagV.contentMode = .scaleAspectFill
        self.contentView.addSubview(imagV)
        
        imagV.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: self.bounds.width - 20, height: self.bounds.height - 25))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
