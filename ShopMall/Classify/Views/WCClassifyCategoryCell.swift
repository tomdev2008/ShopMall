//
//  WCClassifyCategoryCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/25.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCClassifyCategoryCell: UITableViewCell {

    let titleLab:UILabel = UILabel()
    let indicateView:UIView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLab.font = k15Font
        titleLab.textColor = UIColor.flatBlack()
        self.contentView.addSubview(titleLab)
        
        indicateView.backgroundColor = UIColor.flatRed()
        self.contentView.addSubview(indicateView)
        
        titleLab.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        indicateView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.equalTo(5)
            make.height.equalToSuperview()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            indicateView.isHidden = false
            titleLab.textColor = UIColor.flatRed()
            self.backgroundColor = UIColor.white
        }
        else {
            indicateView.isHidden = true
            titleLab.textColor = UIColor.flatBlack()
            self.backgroundColor = UIColor.clear
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
