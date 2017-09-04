//
//  WCShoppingCardEmptyView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/26.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCShoppingCardEmptyView: UIView {

    let imageV:UIImageView = UIImageView()
    let titleLab:UILabel = UILabel()
    let detailLab:UILabel = UILabel()
    let buyBtn:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageV.image = UIImage.init(named: "bj_baobei")
        self.addSubview(imageV)
        
        titleLab.textColor = UIColor.flatGray()
        titleLab.text = "此处非常冷清。。。。"
        titleLab.font = k12Font
        titleLab.textAlignment = .center
        self.addSubview(titleLab)
        
        detailLab.textColor = UIColor.flatOrange()
        detailLab.font = k14Font
        detailLab.text = "DC超市 热血8888元抢不停 →"
        detailLab.textAlignment = .center
        self.addSubview(detailLab)
        
        buyBtn.titleLabel?.font = k14Font
        buyBtn.setTitle("立即抢购", for: .normal)
        buyBtn.setTitleColor(UIColor.flatBlack(), for: .normal)
        buyBtn.backgroundColor = UIColor.white
        self.addSubview(buyBtn)
        
        imageV.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            if kIphone5 {
                make.size.equalTo(CGSize.init(width: 150, height: 150))
            }
            else {
                make.size.equalTo(CGSize.init(width: 170, height: 170))
            }
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        detailLab.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        buyBtn.snp.makeConstraints { (make) in
            make.top.equalTo(detailLab.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 120, height: 35))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
