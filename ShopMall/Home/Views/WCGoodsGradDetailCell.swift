//
//  WCGoodsGradDetailCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCGoodsGradDetailCell: UICollectionViewCell {
    
    let goodsImageView:UIImageView = UIImageView()
    let priceLabel:UILabel = UILabel()
    let stockLabel:UILabel = UILabel()
    let natureLabel:UILabel = UILabel()
    
    var model:WCGoodGrabModel = WCGoodGrabModel() {
    
        didSet {
        
            goodsImageView.kf.setImage(with: URL(string: model.image_url! as String))
            let price:NSString = ((model.price?.intValue)! >= 10000) ? NSString.init(format: "%.2f万", (model.price?.floatValue)! / 10000) : NSString.init(format: "%.2f", (model.price?.floatValue)!)
            priceLabel.text = "¥" + (price as String)
            stockLabel.text = NSString.init(format: "仅剩：%@", model.stock!) as String
            natureLabel.text = model.nature as String?
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        goodsImageView.contentMode = .scaleAspectFill
        self.addSubview(goodsImageView)
        
        priceLabel.font = UIFont.systemFont(ofSize: 12.0)
        priceLabel.textAlignment = NSTextAlignment.center
        self.addSubview(priceLabel)
        
        stockLabel.textColor = UIColor.darkGray
        stockLabel.font = UIFont.systemFont(ofSize: 10)
        stockLabel.textAlignment = NSTextAlignment.center
        self.addSubview(stockLabel)
        
        natureLabel.textAlignment = NSTextAlignment.center
        natureLabel.backgroundColor = UIColor.red
        natureLabel.font = UIFont.systemFont(ofSize: 10)
        natureLabel.textColor = UIColor.white
        goodsImageView.addSubview(natureLabel)
        
        goodsImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(self.bounds.height * 0.8)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(goodsImageView.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }
        
        stockLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }
        
        natureLabel.snp.makeConstraints { (make) in
            make.bottom.left.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 30, height: 15))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
