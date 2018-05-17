//
//  CarouselCell.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
 
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
    }
}
