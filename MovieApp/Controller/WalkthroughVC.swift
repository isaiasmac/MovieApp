//
//  WalkthroughVC.swift
//  MovieApp
//
//  Created by Isaías on 5/11/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

struct WalkthroughPage {
    var title: String
    var subtitle: String
    let imageName: String = "Walkthrough_"
    let pageImageName: String = "pages_"
}

class WalkthroughVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let PAGES = [
        WalkthroughPage(title: "Get the first", subtitle: "Movie & TV information"),
        WalkthroughPage(title: "Know the movie", subtitle: "is not worth Watching"),
        WalkthroughPage(title: "Real-time", subtitle: "updates movie Trailer")
    ]
    var pagesViews: [WalkthroughView] = []
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configPaging()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func configPaging() {
        for (index, page) in PAGES.enumerated() {
            let walkthroughView = WalkthroughView()
            let pageNumber = index + 1
            let x = self.view.frame.size.width * CGFloat(index)
            walkthroughView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: self.view.frame.size.height)
            walkthroughView.backgroundImage.image = UIImage(named: "\(page.imageName)\(pageNumber)")
            walkthroughView.titleLabel.text = page.title
            walkthroughView.subtitleLabel.text = page.subtitle
            walkthroughView.pagesImage.image = UIImage(named: "\(page.pageImageName)\(pageNumber)")
            walkthroughView.nextButton.titleLabel?.text = NSLocalizedString("Next", comment: "")
            if index == PAGES.count - 1{
                walkthroughView.nextButton.setupGradientUI(title: "Get Started")
            }
            walkthroughView.nextButton.pageNumber = pageNumber
            walkthroughView.delegate = self
            scrollView.addSubview(walkthroughView)
            
            self.pagesViews.append(walkthroughView)
        }
        
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false // previene que se pueda hacer Scroll en espacios vacios (primera y ultima)
        scrollView.contentSize.width = self.view.frame.size.width * CGFloat(PAGES.count)
    }
}

extension WalkthroughVC: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Switch the indicator when more than 50% of the previous/next page is visible.
        let pageWidth = scrollView.frame.width
        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
        let currentPage: Int = Int(page)
        
        self.currentPage = currentPage + 1
        
    }
}

extension WalkthroughVC: WalkthroughDelegate{
    
    func nextButtonDidPressed(pageNumber: Int) {
        self.currentPage = pageNumber
        
        if pageNumber >= PAGES.count {
            // Cerrar pantallas Walkthorugh
            // Abrir Pantalla principal de peliculas
            
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let tabBarCtrl = mainStoryboard.instantiateViewController(withIdentifier: "tabBarCtrlID") as! UITabBarController
//            UIApplication.shared.keyWindow?.rootViewController = tabBarCtrl
            
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        var frame = self.scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber) // Ya se guarda con un +1 que es la siguiente vista
        frame.origin.y = 0
        
        self.scrollView.setContentOffset(CGPoint(x: frame.origin.x, y: 0), animated: true)
    }
}
