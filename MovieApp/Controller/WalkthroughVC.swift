//
//  WalkthroughVC.swift
//  MovieApp
//
//  Created by Isaías on 5/11/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class WalkthroughVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    let numberOfPages = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.delegate = self
        
        configPaging()
    }
    
    
    func configPaging() {
        for index in 0..<numberOfPages{
            print("i => \(index)")
            let imageView = UIImageView()
            let x = self.view.frame.size.width * CGFloat(index)
            imageView.frame = CGRect(x: x, y: 0.0, width: scrollView.frame.size.width, height: self.view.frame.size.height)
            imageView.image = UIImage(named: "Walkthrough_\(index + 1)")
            imageView.contentMode = .scaleAspectFill //.scaleAspectFit //.scaleToFill //.scaleAspectFill
            scrollView.addSubview(imageView)
            
//            let mview = UIView()
//            mview.frame = CGRect(x: x, y: 0.0, width: scrollView.frame.size.width, height: self.view.frame.size.height)
//            if index % 2 == 0{
//                mview.backgroundColor = UIColor.green
//            }
//            else{
//                mview.backgroundColor = UIColor.blue
//            }
//            scrollView.addSubview(mview)
        }
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.contentSize.width = self.view.frame.size.width * CGFloat(numberOfPages)
        
        // = CGSize(width: scrollView.frame.size.width * CGFloat(numberOfPages), height: scrollView.frame.size.height)
    }
    
}
//
//extension WalkthroughVC : UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
////        let pageWidth = scrollView.frame.width
////        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
//        //pageControl.currentPage = Int(page)
//    }
//}
