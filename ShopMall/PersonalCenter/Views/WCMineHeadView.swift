//
//  WCMineHeadView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/27.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCMineHeadView: UICollectionReusableView {

    let backGView:UIImageView = UIImageView()
    let forView:UIImageView = UIImageView()
    let portraiBtn:UIButton = UIButton()
    let detailBtn:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backGView.image = UIImage.init(named: "bg_personalcenter")
        self.addSubview(backGView)
        
        forView.image = UIImage.init(named: "shopCircle_Header")
        backGView.addSubview(forView)
        
        portraiBtn.setImage(UIImage.init(named: "icon"), for: .normal)
        self.addSubview(portraiBtn)
        
        detailBtn.setImage(UIImage.init(named: "G6"), for: .normal)
        self.addSubview(detailBtn)
        
        backGView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(-180)
        }
        
        forView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        portraiBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        
        detailBtn.snp.makeConstraints { (make) in
            make.top.equalTo(portraiBtn.snp.bottom).offset(10)
            make.centerX.equalToSuperview()

        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
