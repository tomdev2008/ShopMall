//
//  WCHomeTimeHeadView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/24.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCHomeTimeHeadView: UICollectionReusableView {
    
    var redView:UIView = UIView()
    var timeLab:UILabel = UILabel()
    var countDownLabel:UILabel = UILabel()
    var quickBtn:UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        redView.backgroundColor = UIColor.flatRed()
        self.addSubview(redView)
        
        timeLab.font = UIFont.systemFont(ofSize: 12.0)
        timeLab.text = "6点场"
        self.addSubview(timeLab)
        
        countDownLabel.text = "05:58:33"
        countDownLabel.font = UIFont.systemFont(ofSize: 12.0)
        self.addSubview(countDownLabel)
        
        quickBtn.setTitle("好货秒抢>", for: .normal)
        quickBtn.setTitleColor(UIColor.black, for: .normal)
        quickBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        self.addSubview(quickBtn)
        
        redView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        timeLab.snp.makeConstraints { (make) in
            make.left.equalTo(redView.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        
        countDownLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeLab.snp.right).offset(20)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        quickBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
