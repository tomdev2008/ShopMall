//
//  WCClasssifyDetailModel.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/25.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCClasssifyDetailModel: NSObject {

    var title:String?
    var goods:NSArray?
    
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        
        return ["goods":"WCClassifyDetailSubModel"]
    }
}
