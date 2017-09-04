//
//  WCHotRecommendCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/25.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCHotRecommendCell: UICollectionViewCell {
    
    var imageV:UIImageView!
    var titleLab:UILabel!
    var priceLab:UILabel!
    var sameBtn:UIButton!
    
    var model:WCGoodGrabModel = WCGoodGrabModel() {
        
        didSet {
            
            imageV.kf.setImage(with: URL(string: model.image_url! as String))
            titleLab.text = model.main_title! as String
            priceLab.text = String(format: "¥ %.2f", (model.price?.floatValue)!)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        imageV = UIImageView.init()
        imageV.contentMode = .scaleAspectFill
        self.contentView.addSubview(imageV)
        
        titleLab = UILabel.init()
        titleLab.font = k12Font
        titleLab.numberOfLines = 0
        titleLab.textAlignment = .left
        self.contentView.addSubview(titleLab)
        
        priceLab = UILabel.init()
        priceLab.textColor = UIColor.red
        priceLab.font = k15Font
        self.contentView.addSubview(priceLab)
        
        sameBtn = UIButton.init()
        sameBtn.titleLabel?.font = k10Font
        sameBtn.setTitle("看相似", for: .normal)
        sameBtn.setTitleColor(UIColor.darkGray, for: .normal)
        self.contentView.addSubview(sameBtn)
        
        imageV.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: self.bounds.width - 50, height: self.bounds.width - 50))
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        priceLab.snp.makeConstraints { (make) in
            make.left.equalTo(titleLab.snp.left).offset(0)
            make.top.equalTo(titleLab.snp.bottom).offset(0)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        sameBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(priceLab.snp.centerY).offset(0)
            make.size.equalTo(CGSize.init(width: 35, height: 18))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
