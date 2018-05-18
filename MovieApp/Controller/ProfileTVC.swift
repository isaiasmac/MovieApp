//
//  ProfileTVC.swift
//  MovieApp
//
//  Created by Isaías on 5/18/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class LikeMovieCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
}

class ProfileTVC: UITableViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var likeBoxView: UIView!
    
    let likeMovies = ["arrival_cover", "batman_cover", "flash_cover", "iron_man_cover", "wonder_woman_cover", "rampage_cover", "narcos_cover"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
    
    func setupUI(){
        self.tableView.backgroundColor = Constants.GLOBAL_COLOR
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.profileImageView.image = #imageLiteral(resourceName: "stone_cold_profile")
        self.profileLabel.text = "Steve Austin"
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width/2
        self.profileImageView.layer.masksToBounds = true
        
        self.likeBoxView.layer.cornerRadius = 4
        
        // Cache shadow
        self.likeBoxView.layer.shouldRasterize = true
        self.likeBoxView.layer.shadowColor = UIColor.darkGray.cgColor
        self.likeBoxView.layer.shadowOpacity = 0.2
        self.likeBoxView.layer.shadowOffset = CGSize.zero
        self.likeBoxView.layer.shadowRadius = 3.5
    }

}

extension ProfileTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.view.frame.width/4, height: 120.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
}

extension ProfileTVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likeMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_like", for: indexPath) as! LikeMovieCell
        cell.coverImageView.image = UIImage(named: likeMovies[indexPath.item])
        return cell
    }
}
