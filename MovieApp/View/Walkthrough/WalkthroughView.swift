//
//  WalkthroughView.swift
//  MovieApp
//
//  Created by Isaías on 5/15/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class WalkthroughView: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var pagesImage: UIImageView!
    @IBOutlet weak var nextButton: WalkthroughButton!
    
    weak var delegate: WalkthroughDelegate?
    
//    class func instanceFromNib() -> UIView {
//        return UINib(nibName: "WalkthroughView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
//    }

    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("WalkthroughView", owner: self, options: nil)

        self.contentView.frame = self.frame
        //content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.addSubview(self.contentView)
        self.nextButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    }
    
    
    @objc func pressButton(_ sender: WalkthroughButton){
        self.delegate?.nextButtonDidPressed(pageNumber: sender.pageNumber)
    }
}


protocol WalkthroughDelegate: class{
    func nextButtonDidPressed(pageNumber: Int)
}
