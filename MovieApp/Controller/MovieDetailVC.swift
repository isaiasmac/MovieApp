//
//  MovieDetailVC.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit
import Kingfisher
import PKHUD

class MovieDetailVC: UIViewController {

    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var scrollViewCast: UIScrollView!
    
    let movieModel = MoviesModel()
    var movieDetail: Movie = Movie()
    var coverImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUI()
        self.getMovieDetails()
    }
    
    private func setUI(){
        
        
        if let coverLarge = self.movieDetail.coverLarge {
            coverImageView.frame = self.coverView.frame
            coverImageView.kf.setImage(with: URL(string: coverLarge))
            self.coverView.insertSubview(coverImageView, at: 0)
        }
        self.nameLabel.text = self.movieDetail.title
        self.ratingLabel.text = self.movieDetail.getStrRating()
        self.summaryLabel.text = self.movieDetail.summary
    }
    
    private func getMovieDetails(){
        HUD.show(.progress)
        
        self.movieModel.getMovieDetail(movieId: self.movieDetail.mId) { (success, movie) in
            
            if success{
                if let cast = movie?.cast {
                    self.addCastUI(cast)
                    
                    self.scrollViewCast.showsHorizontalScrollIndicator = false
                    self.scrollViewCast.showsVerticalScrollIndicator = false
                    self.scrollViewCast.isPagingEnabled = true
                    self.scrollViewCast.bounces = false // previene que se pueda hacer Scroll en espacios vacios (primera y ultima)
                    self.scrollViewCast.contentSize.width = CGFloat(cast.count) * self.view.frame.width
                }
            }
            
            HUD.hide(animated: true)
        }
    }
    
    fileprivate func addCastUI(_ cast: [Cast]){
        for (index, c) in cast.enumerated() {
            let castWidth:CGFloat = 80.0
            let castView = UIView()
            castView.frame.origin.x = castWidth * CGFloat(index) + (CGFloat(index) * 2)
            castView.frame.size.width = castWidth
            castView.frame.size.height = 140.0
            
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: castView.frame.width,
                                     height: castView.frame.height - 30)
            imageView.image = UIImage(named: "profile_placeholder")
            
            if let smallImgUrl = c.imageSmall {
                imageView.kf.setImage(with: URL(string: smallImgUrl), placeholder: UIImage(named: "profile_placeholder"))
            }
            imageView.layer.cornerRadius = 4
            imageView.layer.masksToBounds = true
            castView.addSubview(imageView)
            
            let nameActorLabel = UILabel()
            nameActorLabel.frame = CGRect(x: 2, y: castView.frame.height - 20, width: castView.frame.width, height: 20.0)
            nameActorLabel.text = c.name
            nameActorLabel.font = UIFont.boldSystemFont(ofSize: 11.5)
            castView.addSubview(nameActorLabel)
            
            self.scrollViewCast.addSubview(castView)
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        let image = self.coverImageView.image
        let text = self.movieDetail.title
        let url = URL(string: self.movieDetail.torrentUrl!)
        
        let textToShare: [Any] = [text, image!, url!]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // iPad !!
        activityViewController.excludedActivityTypes = [.airDrop]
        
        OperationQueue.main.addOperation {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
}
