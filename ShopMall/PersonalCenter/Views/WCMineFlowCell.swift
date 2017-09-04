//
//  WCMineFlowCell.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/26.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

enum WCMineFlowCellType {
    case WCMineFlowCellTypeImage
    case WCMineFlowCellTypeLabel
}
class WCMineFlowCell: UICollectionViewCell {
    
    let imageV:UIImageView = UIImageView()
    let titleLab:UILabel = UILabel()
    let detailLab:UILabel = UILabel()
    var isLastItem:Bool = false
    var type:WCMineFlowCellType = WCMineFlowCellType.WCMineFlowCellTypeImage
    
    var model:WCMineFlowModel = WCMineFlowModel() {
        
        didSet {
            
            imageV.image = UIImage.init(named: model.flowImageView!)
            titleLab.text = model.flow_title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageV.contentMode = .scaleAspectFill
        
        titleLab.font = k12Font
        titleLab.textAlignment = .center
        
        detailLab.font = k13Font
        detailLab.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if type == WCMineFlowCellType.WCMineFlowCellTypeImage {
            detailLab.removeFromSuperview()
            self.addSubview(imageV)
            self.addSubview(titleLab)
            
            imageV.snp.makeConstraints({ (make) in
                make.top.equalToSuperview()
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSize.init(width: 35, height: 35))
            })
            
            titleLab.snp.makeConstraints({ (make) in
                make.top.equalTo(imageV.snp.bottom).offset(0)
                make.centerX.equalToSuperview()
            })
        }
        else {
            self.addSubview(titleLab)
            if isLastItem {
                self.addSubview(imageV)
                imageV.snp.makeConstraints({ (make) in
                    make.top.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.size.equalTo(CGSize.init(width: 35, height: 35))
                })
                
                titleLab.snp.makeConstraints({ (make) in
                    make.top.equalTo(imageV.snp.bottom).offset(0)
                    make.centerX.equalToSuperview()
                })
            }
            else {
                imageV.removeFromSuperview()
                self.addSubview(detailLab)
                detailLab.snp.makeConstraints({ (make) in
                    make.top.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.size.equalTo(CGSize.init(width: 35, height: 35))
                })
                
                titleLab.snp.makeConstraints({ (make) in
                    make.top.equalTo(detailLab.snp.bottom).offset(0)
                    make.centerX.equalToSuperview()
                })
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
