//
//  WCHomeTenGridsCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/13.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCHomeTenGridsCell: UICollectionViewCell {
    
    var model:WCHomeGridModel = WCHomeGridModel() {
        
        didSet {
            let url = URL(string: model.iconImage!)
            imgeView.kf.setImage(with: url)
            titleLab.text = model.gridTitle
        }
    }
    
    private var imgeView:UIImageView = UIImageView()
    private var titleLab:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    func setUp() -> Void {
        
        imgeView = UIImageView.init()
        imgeView.contentMode = .scaleAspectFill
        self.contentView.addSubview(imgeView)
        
        titleLab = UILabel.init()
        titleLab.font = UIFont.systemFont(ofSize: 13.0);
        titleLab.textAlignment = .center
        self.contentView.addSubview(titleLab)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgeView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(CGSize.init(width: 50, height: 50))
            make.centerX.equalToSuperview()
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(imgeView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
