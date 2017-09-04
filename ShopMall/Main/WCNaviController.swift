//
//  WCNaviController.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/7.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    func setUp() -> Void {
        let bar:UINavigationBar = self.navigationBar
        bar.barTintColor = RGBA(r: 231, g: 23, b: 37, a: 1.0)
        bar.shadowImage = UIImage()
        bar.tintColor = UIColor.white
        
        let attributes = NSMutableDictionary.init()
        attributes[NSForegroundColorAttributeName] = UIColor.white
        attributes[NSFontAttributeName] = kNav_20Font
        bar.titleTextAttributes = attributes as? [String : Any]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count >= 1 {
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: .done, target: self, action: #selector(WCNaviController.backClick))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func backClick() -> Void {
        self.popViewController(animated: true)
    }
}
