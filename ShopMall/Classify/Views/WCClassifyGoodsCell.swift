//
//  WCClassifyGoodsCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/25.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCClassifyGoodsCell: UICollectionViewCell {
    
    let imagV:UIImageView = UIImageView()
    let titleLab:UILabel = UILabel()
    
    var model:NSDictionary = NSDictionary() {
        
        didSet {
            
            if ((model["image_url"] as! String).contains("http")) {
                
                imagV.kf.setImage(with: URL(string: model["image_url"]! as! String))
                
            } else {
              
                imagV.image = UIImage.init(named: model["image_url"]! as! String)
            }
            
            titleLab.text = model["goods_title"] as? String
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = RGBA(r: 245, g: 245, b: 245, a: 1.0)
        imagV.contentMode = .scaleAspectFit
        self.contentView.addSubview(imagV)
        
        titleLab.font = k13Font
        titleLab.textAlignment = .center
        self.contentView.addSubview(titleLab)
        
        imagV.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: self.bounds.width * 0.85, height: self.bounds.width * 0.85))
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imagV.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(imagV)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
