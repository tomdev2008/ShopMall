//
//  YQSlideBannerView.swift
//  ShopMall
//
//  Created by longsirHERO on 2017/7/19.
//  Copyright © 2017年 WingChingYip(https://longsirhero.github.io). All rights reserved.
//

import UIKit

protocol YQSlideBannerViewDelegate:NSObjectProtocol {

    func bannerViewDidSelectItemAtIndex(bannerView:YQSlideBannerView,index:NSInteger)
}

class YQSlideBannerView: UIView {

    /** 图片 url string 数组 */
    var imageUrls:NSArray = NSArray() {
        
        didSet {
            
            
            setUpPageControl()
            setUpTimer()
        }
    }
    
    /** 自动滚动间隔时间,默认2s */
    var autoScrollTimeInterval:CGFloat = 2.0 {
        
        didSet {
            
            invalidateTimer()
            if autoScrool == true {
                setUpTimer()
            }
        }
    }
    
    /** 是否无限循环,默认Yes */
    var infiniteLoop:Bool = true
    
    /** 是否自动滚动,默认Yes */
    var autoScrool:Bool = true {
        
        didSet {
            
            invalidateTimer()
            if autoScrool == true {
                setUpTimer()
            }
        }
    }
    
    /** 图片滚动方向，默认为水平滚动 */
    var scrollDirect:UICollectionViewScrollDirection = .horizontal
    
    /** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
    var bannerImageViewContentMode:UIViewContentMode = .scaleToFill
    
    /** 占位图，用于网络未加载到图片时 */
    var placeholderImage:UIImage?
    
    /** 是否显示分页控件 */
    var showPageControl:Bool = true {
        
        didSet {
            
            if showPageControl == false {
                if showPageControl {
                    pageControl.isHidden = true
                }
                else {
                    pageControl.isHidden = false
                }
            }
        }
    }
    
    /** 是否在只有一张图时隐藏pagecontrol，默认为YES */
    var hidesForSinglePage:Bool = true {
        
        didSet {
            
            if hidesForSinglePage == false {
                pageControl.isHidden = false
            }
            else {
                pageControl.isHidden = true
            }
        }
    }
    
    /** 分页控件小圆标大小 */
    var pageControlDotSize:CGSize = CGSize.init(width: 10, height: 10) {
    
        didSet {
            
            setUpPageControl()
        }
    }
    
    /** 当前分页控件小圆标颜色 */
    var currentPageDotColor:UIColor = UIColor.white {
        
        didSet {
            
            setUpPageControl()
        }
    }
    
    /** 其他分页控件小圆标颜色 */
    var pageDotColor:UIColor = UIColor.lightGray {
        
        didSet {
            
            setUpPageControl()
        }
    }
    
    /** delegate **/
    weak open var delegate:YQSlideBannerViewDelegate?
    
    var flowLayout:UICollectionViewFlowLayout!
    var collectionView:UICollectionView!
    var pageControl:UIPageControl!
    var timer:Timer!
    
    //MARK: Init
    class func initBannerView(frame:CGRect,placeholderImage:UIImage) -> YQSlideBannerView {
        
        let bannerView:YQSlideBannerView = YQSlideBannerView.init(frame: frame)
        bannerView.placeholderImage = placeholderImage
        return bannerView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialization()
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialization() -> Void {
        scrollDirect = .horizontal
        bannerImageViewContentMode = .scaleToFill
        
        self.backgroundColor = UIColor.lightGray
    }

    // 创建九宫格
    func setUp() -> Void {
        
        flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize.init(width: self.bounds.width, height: self.bounds.height)
        
        collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.contentOffset = CGPoint(x: kScreenW, y: 0)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(YQSlideBannerViewCell.self, forCellWithReuseIdentifier: "bannerCell")
        self.addSubview(collectionView)
    }
    
    // 创建分页控制器
    func setUpPageControl() -> Void {
        
        if (pageControl != nil) {
            pageControl.removeFromSuperview()
        }
        if (pageControl != nil) && (showPageControl == false || hidesForSinglePage == true) {
            pageControl.removeFromSuperview()
            return
        }
        
        pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: 0, width: (pageControlDotSize.width) * CGFloat(imageUrls.count) * 1.2, height: (pageControlDotSize.height)))
        pageControl.center.x = self.center.x
        pageControl.mj_origin.y = self.mj_size.height - (pageControlDotSize.height) - 5.0
        pageControl.currentPageIndicatorTintColor = currentPageDotColor
        pageControl.pageIndicatorTintColor = pageDotColor
        pageControl.numberOfPages = imageUrls.count - 2
        self.addSubview(pageControl)
    }
    
    // 创建倒计时
    func setUpTimer() -> Void {
    
        timer = Timer.scheduledTimer(timeInterval: Double(autoScrollTimeInterval), target: self, selector: #selector(YQSlideBannerView.automaticScroll), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    // 每间隔时间调用一次
    func automaticScroll() -> Void {
        
        if imageUrls.count == 0 {
            return
        }
        
        let currentIndex = self.currentIndex()
        let targetIndex = currentIndex + 1
        
        
        if targetIndex >= imageUrls.count - 1 {
            if infiniteLoop {
                collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .left, animated: false)
            }
            return
        }
        
         collectionView.scrollToItem(at: IndexPath.init(row: targetIndex, section: 0), at: .right, animated: true)
    }
    
    // 获取当前滚动视图的下标
    func currentIndex() -> NSInteger {
        
        var index = 0
        if flowLayout.scrollDirection == .horizontal {
            index = Int((collectionView.contentOffset.x + flowLayout.itemSize.width * 0.5) / flowLayout.itemSize.width)
        }
        else {
            index = Int((collectionView.contentOffset.y + flowLayout.itemSize.height * 0.5) / flowLayout.itemSize.height)
        }
        return max(0, index)
    }
    
    // 取消定时器
    func invalidateTimer() -> Void {
        
        timer.invalidate()
        timer = nil
    }
}

extension YQSlideBannerView:UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate {
    
    //mark: -CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:YQSlideBannerViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! YQSlideBannerViewCell
        let imageUrl = imageUrls[indexPath.row]
        if imageUrl is UIImage {
            cell.imgView.image = imageUrl as? UIImage
        }
        else if String(describing: imageUrl).hasPrefix("http") {
            cell.imgView.kf.setImage(with: URL(string: imageUrl as! String))
        }
        else {
            cell.imgView.image = UIImage.init(named: imageUrl as! String)
        }
        return cell
    }
    
    //MARK: -UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if pageControl != nil {
            pageControl.currentPage = currentIndex() - 1
            print(currentIndex())
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        if autoScrool == true {
            invalidateTimer()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if autoScrool == true {
            setUpTimer()
        }
    }
    
    // 手势导致
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let contentOffSetWhenFullyScrollRight:CGFloat = collectionView.frame.size.width * CGFloat(imageUrls.count - 1)
        
        if scrollView.contentOffset.x >= contentOffSetWhenFullyScrollRight {
            collectionView.scrollToItem(at: IndexPath.init(row: 1, section: 0), at: .left, animated: false)
        }
        else if scrollView.contentOffset.x <= 0 {
            collectionView.scrollToItem(at: IndexPath.init(row: imageUrls.count - 2, section: 0), at: .right, animated: false)
        }
        
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        
    }
}
