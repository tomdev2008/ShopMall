//
//  WCShoppingCardCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/26.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCShoppingCardCell: UICollectionViewCell {
    let imagV:UIImageView = UIImageView()
    let titleLab:UILabel = UILabel()
    let priceLab:UILabel = UILabel()
    
    var model:WCGoodGrabModel = WCGoodGrabModel() {
        
        didSet {
            
            imagV.kf.setImage(with: URL(string: model.image_url! as String))
            titleLab.text = model.main_title! as String
            priceLab.text = (model.price?.intValue)! >= 10000 ? String(format: "¥ %.2f万", (model.price?.floatValue)! / 10000.0) : String(format: "¥ %.2f", (model.price?.floatValue)!)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imagV.contentMode = .scaleAspectFill
        self.contentView.addSubview(imagV)
        
        titleLab.font = k12Font
        titleLab.numberOfLines = 0
        self.contentView.addSubview(titleLab)
        
        priceLab.font = k12Font
        priceLab.textColor = UIColor.flatRed()
        self.contentView.addSubview(priceLab)
        
        imagV.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: self.bounds.width * 0.8, height: self.bounds.height - 50))
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imagV.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        priceLab.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
