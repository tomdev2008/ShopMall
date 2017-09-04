//
//  WCMineHotRecommendCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/26.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCMineHotRecommendCell: UICollectionViewCell {
    
    let imagV:UIImageView = UIImageView()
    let titleLab:UILabel = UILabel()
    let priceLab:UILabel = UILabel()
    
    var model:WCGoodGrabModel = WCGoodGrabModel() {
        
        didSet {
            
            imagV.kf.setImage(with: URL(string: model.image_url! as String))
            priceLab.text = String(format: "¥ %.2f", (model.price?.floatValue)!)
            titleLab.text = model.main_title! as String
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.white
        imagV.contentMode = .scaleAspectFill
        self.contentView.addSubview(imagV)
        
        titleLab.font = k12Font
        titleLab.numberOfLines = 0
        titleLab.textAlignment = .left
        self.contentView.addSubview(titleLab)
        
        priceLab.font = k12Font
        priceLab.textColor = UIColor.flatOrange()
        self.contentView.addSubview(priceLab)
        
        imagV.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(self.bounds.height - 60)
            make.centerX.equalToSuperview()
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imagV.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
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
