//
//  WalkthroughButton.swift
//  MovieApp
//
//  Created by Isaías on 5/14/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class WalkthroughButton: UIButton {
    
    var pageNumber: Int = 0
    let buttonColor = UIColor.white
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setupUI(){
        self.setImage(UIImage(named: "arrow_right"), for: .normal)
        self.tintColor = buttonColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        let extra_margin: CGFloat = 1.55 // Más alto el valor, más cerca del texto quedará
        let margin_text: CGFloat = -70 // Más bajo el valor, más apegado al borde izquierdo quedará
        imageEdgeInsets = UIEdgeInsets(top: 0, left: bounds.width/extra_margin, bottom: 0, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: margin_text, bottom: 0, right: (imageView?.frame.width)!)
        
        self.layer.borderWidth = 1.5
        self.layer.borderColor = buttonColor.cgColor
        self.layer.cornerRadius = self.frame.size.width/6
    }
    
    func setupGradientUI(title: String){
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        self.setImage(nil, for: .normal)
        self.titleEdgeInsets = UIEdgeInsets.zero
        self.layer.borderWidth = 0
        
        let topGradient = UIColor(red:0.98, green:0.62, blue:0.00, alpha:1.0)
        let bottomGradient = UIColor(red:0.86, green:0.19, blue:0.41, alpha:1.0)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [topGradient.cgColor, bottomGradient.cgColor]
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.borderWidth = 0
        gradientLayer.borderColor = UIColor.clear.cgColor
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
