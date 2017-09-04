//
//  WCCommon.swift
//  LOLDemo
//
//  Created by longsirHERO on 2017/6/28.
//  Copyright © 2017年 WingChingYip. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Alamofire
import ChameleonFramework
import Kingfisher
import MJRefresh
import MJExtension

// 当前系统版本
let kCersion = (UIDevice.current.systemVersion as NSString).floatValue
// 屏幕宽度
let kScreenH = UIScreen.main.bounds.height
// 屏幕高度
let kScreenW = UIScreen.main.bounds.width
let KWidth_ScaleTo6s = UIScreen.main.bounds.width/414.0
let KHeight_ScaleTo6s = UIScreen.main.bounds.height/736.0

let RecentRUL_1  = "http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetVideoList&heroId=0&authorId=0&keyword=&page="
let RecentRUL_2  = "&pageSize=10&order=new&albumId=0&isIpad=0"

// 夏日清凉大排档
let GoodsRecommendArray:NSArray = ["http://gfs8.gomein.net.cn/T1TkDvBK_j1RCvBVdK.jpg","http://gfs1.gomein.net.cn/T1loYvBCZj1RCvBVdK.jpg","http://gfs1.gomein.net.cn/T1w5bvB7K_1RCvBVdK.jpg","http://gfs1.gomein.net.cn/T1w5bvB7K_1RCvBVdK.jpg","http://gfs6.gomein.net.cn/T1L.VvBCxv1RCvBVdK.jpg","http://gfs9.gomein.net.cn/T1joLvBKhT1RCvBVdK.jpg","http://gfs5.gomein.net.cn/T1AoVvB7_v1RCvBVdK.jpg"];

// 品牌精选
let GoodsHandheldImagesArray:NSArray = ["http://gfs1.gomein.net.cn/T1koKvBT_g1RCvBVdK.jpg","http://gfs3.gomein.net.cn/T1n5JvB_Eb1RCvBVdK.jpg","http://gfs10.gomein.net.cn/T1jThTB_Ls1RCvBVdK.jpeg","http://gfs7.gomein.net.cn/T1T.YvBbbg1RCvBVdK.jpg","http://gfs6.gomein.net.cn/T1toCvBKKT1RCvBVdK.jpg","http://gfs5.gomein.net.cn/T1JZLvB4Jj1RCvBVdK.jpg","http://gfs5.gomein.net.cn/T1JZLvB4Jj1RCvBVdK.jpg","http://gfs3.gomein.net.cn/T1ckKvBTW_1RCvBVdK.jpg","http://gfs.gomein.net.cn/T1hNCvBjKT1RCvBVdK.jpg"]

// Font
let kNav_20Font = UIFont.systemFont(ofSize: 20)
let k13Font = UIFont.systemFont(ofSize: 13)
let k12Font = UIFont.systemFont(ofSize: 12)
let k14Font = UIFont.systemFont(ofSize: 14)
let k15Font = UIFont.systemFont(ofSize: 15)
let k16Font = UIFont.systemFont(ofSize: 16)
let k10Font = UIFont.systemFont(ofSize: 10)

// 屏幕适配
let kIphone4:Bool = kScreenH == 480
let kIphone5:Bool = kScreenH == 568
let kIphone6:Bool = kScreenH == 667
let kIphone6p:Bool = kScreenH == 763

// MARK:- 颜色方法
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


// MARK:- 自定义打印方法
func LXFLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(message)")
        
    #endif
}
