//
//  NowCell.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class NowCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.coverImageView.layer.cornerRadius = 5
        self.coverImageView.layer.masksToBounds = true
        
        // Cache shadow
        self.coverImageView.layer.shouldRasterize = true
        self.coverImageView.layer.shadowColor = UIColor.black.cgColor
        self.coverImageView.layer.shadowOpacity = 0.7
        self.coverImageView.layer.shadowOffset = CGSize.zero
        self.coverImageView.layer.shadowRadius = 8.5
        // Mejor performance, ya que no calcula dinamicamente
        self.coverImageView.layer.shadowPath = UIBezierPath(rect: self.coverImageView.bounds).cgPath
        
    }
}
