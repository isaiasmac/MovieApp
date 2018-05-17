//
//  PopularCell.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class PopularCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.coverImageView.layer.cornerRadius = 5
        self.coverImageView.layer.masksToBounds = true
        
        self.yearLabel.textColor = UIColor.white
        self.titleLabel.textColor = UIColor.white
        self.shadowView.backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:0.24)
        
        self.ratingLabel.layer.cornerRadius = self.ratingLabel.frame.width/2
        self.ratingLabel.layer.masksToBounds = true
        self.ratingLabel.textColor = UIColor.white
        self.ratingLabel.font = UIFont.boldSystemFont(ofSize: 15.5)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        // Gradient para el fondo
        let topGradient = UIColor(red:0.98, green:0.62, blue:0.00, alpha:1.0)
        let bottomGradient = UIColor(red:0.86, green:0.19, blue:0.41, alpha:1.0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = ratingLabel.bounds
        gradientLayer.colors = [topGradient.cgColor, bottomGradient.cgColor]
        gradientLayer.cornerRadius = ratingLabel.layer.cornerRadius
        gradientLayer.borderWidth = 0
        gradientLayer.borderColor = UIColor.clear.cgColor
        ratingLabel.layer.insertSublayer(gradientLayer, at: 0)
        
        // Layer para el texto ya que el Gradient lo pone encima
        let textLayer = CATextLayer()
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.string = ratingLabel.text
        textLayer.font = UIFont.boldSystemFont(ofSize: 10.5)
        textLayer.fontSize = 15.5
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.frame = CGRect(x: 0, y: 5, width: ratingLabel.frame.width, height: ratingLabel.frame.height)
        ratingLabel.layer.insertSublayer(textLayer, at: 1)
    }
}
