//
//  SalesCollectionViewCell.swift
//  Nequore
//
//  Created by Mahajan on 14/10/18.
//  Copyright © 2018 Mahajan. All rights reserved.
//

import UIKit
import Kingfisher

class SalesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var developerNameLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 5.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect:self.contentView.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
    
    func configure(preSales:PreSale) {
        let configurations = preSales.configurations![0]
        self.developerNameLabel.text = preSales.developer?.name
        self.priceLabel.text = String(format: "$ %d", preSales.starting_price ?? 0)
        self.typeLabel.text =  configurations.config?.name
        let url = URL(string: preSales.main_image!)
        mainImageView.kf.setImage(with: url, placeholder: UIImage.init(named: "placeholder"))
    
    }
}
