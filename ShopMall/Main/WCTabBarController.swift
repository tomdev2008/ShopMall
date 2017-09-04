//
//  WCTabBarController.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/7.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

class WCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add subController
        let homeVC = WCHomeController()
        setUpChildViewControllers(vc:homeVC,title: "", image: "tabr_01_up", selectImage: "tabr_01_down")
        
        let classVC = WCClassifyController()
        setUpChildViewControllers(vc: classVC,title: "", image: "tabr_02_up", selectImage: "tabr_02_down")
        
        let shopVC = WCShoppingController()
        setUpChildViewControllers(vc:shopVC,title: "购物车", image: "tabr_04_up", selectImage: "tabr_04_down")
        
        let mineVC = WCMineController()
        setUpChildViewControllers(vc:mineVC,title: "我的", image: "tabr_05_up", selectImage: "tabr_05_down")
        
        // custom tabbar
        let tabBar = WCTabBar()
        tabBar.backgroundColor = UIColor.white
        self.setValue(tabBar, forKey: "tabBar")
        
        self.delegate = self
    }

    func setUpChildViewControllers(vc: WCBaseController,title:String,image:String,selectImage:String) -> Void {
        
        vc.title = title
        let nav = WCNaviController.init(rootViewController: vc)
        nav.tabBarItem.title = nil
        nav.tabBarItem.image = UIImage.init(named: image)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectImage)
        nav.tabBarItem.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        self.addChildViewController(nav)
    }
}

// MARK: Delegate
extension WCTabBarController:UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        tabBarButtonClick(tabBarButton: getSelectTabBarButtom())
    }
    
    func getSelectTabBarButtom() -> UIControl {
        
        let tabBarButtoms = NSMutableArray.init(capacity: 0)
        for view in self.tabBar.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                tabBarButtoms.add(view)
            }
        }
        let control:UIControl = tabBarButtoms.object(at: self.selectedIndex) as! UIControl
        return control
    }
    
    func tabBarButtonClick(tabBarButton:UIControl) -> Void {
        
        for imageView in tabBarButton.subviews {
            if imageView.isKind(of: NSClassFromString("UITabBarSwappableImageView")!) {
                
                let animation:CAKeyframeAnimation = CAKeyframeAnimation()
                animation.keyPath = "transform.scale"
                animation.values = [1.0,1.1,0.9,1.0]
                animation.duration = 0.3
                animation.calculationMode = kCAAnimationCubic
                imageView.layer.add(animation, forKey: nil)
            }
        }
    }
}
