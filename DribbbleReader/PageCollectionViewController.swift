//
//  PageCollectionViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

struct Pages {
//    var viewControllers:[UIViewController] = []
    var viewControllers:[ShotCollectionViewController] = []
}

class PageCollectionViewController: UICollectionViewController {
    
    var pages:Pages = Pages(){
        didSet { self.collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "PageCollectionViewCell")
        
//        self.automaticallyAdjustsScrollViewInsets = false
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.greenColor()
//        let popularShot = ShotCollectionViewController()
//        vc.view.addSubview(popularShot.collectionView!)
//        self.pages.viewControllers.append(vc)
//        
//        let vc2 = UIViewController()
//        vc2.view.backgroundColor = UIColor.grayColor()
//        self.pages.viewControllers.append(vc2)
        
        let popularShot = ShotCollectionViewController()
        self.pages.viewControllers.append(popularShot)

        let popularShot2 = ShotCollectionViewController()
        popularShot2.view.backgroundColor = UIColor.greenColor()
        self.pages.viewControllers.append(popularShot2)
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pages.viewControllers.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("PageCollectionViewCell", forIndexPath: indexPath) as! UICollectionViewCell
        let view = self.pages.viewControllers[indexPath.row].view
        cell.contentView.addSubview(view)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var pageViewRect = self.view.bounds
        return CGSize(width: pageViewRect.width, height: pageViewRect.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
}