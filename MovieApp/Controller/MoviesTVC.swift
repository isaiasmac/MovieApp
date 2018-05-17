//
//  MoviesTVC.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftSpinner
import PKHUD

class MoviesTVC: UITableViewController {
    
    @IBOutlet weak var collectionViewCarousel: UICollectionView!
    @IBOutlet weak var collectionViewNow: UICollectionView!
    @IBOutlet weak var collectionViewPopular: UICollectionView!
    
    lazy var collectionViews: [UICollectionView] = [collectionViewCarousel, collectionViewNow, collectionViewPopular]
    let moviesModel: MoviesModel = MoviesModel()
    
    var carouselImages: [String] = ["cover_appletv", "cover_avengers", "cover_cooking"]
    var moviesNow: [Movie] = []
    var moviesPopular: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCollectionViews()
        self.tableView.allowsSelection = false
        
        HUD.show(.progress)
        
//        moviesModel.getMoviesOnline(limit: 10) { (success, movies) in
//            if success{
//                self.moviesNow = movies!
//
//                DispatchQueue.main.async() {
//                    HUD.hide(animated: true)
//                    self.collectionViewNow.reloadData()
//                }
//            }
//        }

        moviesModel.getMoviesOffline { (success, movies) in
            if success{
                let moviesArray = movies!
                self.moviesNow = moviesArray.reversed()
                self.moviesPopular = moviesModel.findPopular(movies: moviesArray)
                
                DispatchQueue.main.async() {
                    HUD.hide(animated: true)
                    self.collectionViewNow.reloadData()
                }
            }
        }
    }
    
    fileprivate func setupCollectionViews(){
        for c in self.collectionViews{
            c.dataSource = self
            c.delegate = self
            
            if let layout = c.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            c.showsHorizontalScrollIndicator = false
            c.isPagingEnabled = true
            c.backgroundColor = UIColor.white
        }
    }
    
    
//    // https://gist.github.com/benjaminsnorris/a19cb14082b28027d183
//    fileprivate func snapToCenter() {
//        let centerPoint = view.convert(view.center, to: collectionViewCarousel)
//
//        guard let centerIndexPath = collectionViewCarousel.indexPathForItem(at: centerPoint) else{
//            return
//        }
//
//        collectionViewCarousel.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
//    }
//
//    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if let _ = scrollView as? UICollectionView {
//            snapToCenter()
//        }
//    }
//
//    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if let _ = scrollView as? UICollectionView {
//            if !decelerate {
//                snapToCenter()
//            }
//        }
//    }
}


// MARK: UICollectionView Delegate FlowLayout
extension MoviesTVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if collectionView == collectionViewNow {
            return CGSize(width: 140.0, height: 238.0)
        }
        else if collectionView == collectionViewCarousel{
            return CGSize(width: 300.0, height: 170.0)
        }
        else{
            return CGSize(width: 140.0, height: 220.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        if collectionView == self.collectionViewCarousel{
            return 50.0; // Espacio Horizontal
        }
        else{
            return 5.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        if collectionView == self.collectionViewCarousel {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        else if collectionView == self.collectionViewNow {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
        }
        else{
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 5)
        }
    }
    
}

// MARK: - UICollectionView DataSource
extension MoviesTVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewCarousel {
            return self.carouselImages.count
        }
        else if collectionView == self.collectionViewNow {
            return self.moviesNow.count
        }
        else{
            return self.moviesPopular.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewCarousel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarouselCell
            cell.coverImageView.image = UIImage(named: self.carouselImages[indexPath.item])
            
            return cell
        }
        else if collectionView == collectionViewNow {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_now", for: indexPath) as! NowCell
            
            let movie = moviesNow[indexPath.item]
            cell.titleLabel.text = movie.title.uppercased()
            if let coverUrl = movie.cover_medium{
                cell.coverImageView.kf.setImage(with: URL(string: coverUrl), placeholder: UIImage(named: "movie_placeholder"))
            }
            
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_popular", for: indexPath) as! PopularCell
            let movie = moviesPopular[indexPath.item]
            
            cell.titleLabel.text = movie.title.uppercased()
            if let coverUrl = movie.cover_medium{
                cell.coverImageView.kf.setImage(with: URL(string: coverUrl), placeholder: UIImage(named: "movie_placeholder"))
            }
            cell.yearLabel.text = String(movie.year)
            cell.ratingLabel.text = String(movie.rating!)
            return cell
        }
    }
}
