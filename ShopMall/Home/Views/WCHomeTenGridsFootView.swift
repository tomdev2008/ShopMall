//
//  WCHomeTenGridsFootView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/21.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCHomeTenGridsFootView: UICollectionReusableView {
    
    let porImgView:UIImageView = UIImageView()
    let titleLab:UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        porImgView.image = UIImage.init(named: "shouye_img_toutiao")
        self.addSubview(porImgView)
        porImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        titleLab.text = "github 你值得拥有，欢迎点赞~"
        titleLab.font = UIFont.systemFont(ofSize: 12.0)
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(porImgView.snp.right).offset(5)
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
