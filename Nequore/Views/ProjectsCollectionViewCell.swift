//
//  ProjectsCollectionViewCell.swift
//  Nequore
//
//  Created by Mahajan on 14/10/18.
//  Copyright © 2018 Mahajan. All rights reserved.
//

import UIKit
import Kingfisher
class ProjectsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var propertNameLabel: UILabel!
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
    
    func configure(projects: PopularProjects) {
        let configurations = projects.configurations![0]
        self.developerNameLabel.text = projects.developer?.name
        self.propertNameLabel.text = projects.name
        self.labelName.text = String(format: "$ %d", projects.starting_price ?? 0)
        self.typeLabel.text =  configurations.config?.name
        let url = URL(string: projects.main_image!)
        mainImageView.kf.setImage(with: url, placeholder: UIImage.init(named: "placeholder"))
    }
}
