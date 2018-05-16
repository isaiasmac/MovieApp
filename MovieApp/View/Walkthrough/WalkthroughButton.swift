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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
        Override the layoutSubviews() function, this function needs
         to be overridden rather than awakeFromNib, as at this point
         it is possible to get the real size of the button
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    

}
