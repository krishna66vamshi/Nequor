//
//  LocalitiesTableViewCell.swift
//  Nequore
//
//  Created by Mahajan on 14/10/18.
//  Copyright © 2018 Mahajan. All rights reserved.
//

import UIKit

class LocalitiesTableViewCell: UITableViewCell {
    var featureLocalities:[FeaturedLocalities] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(localities: [FeaturedLocalities]) {
        self.featureLocalities = localities
        self.collectionView.reloadData()
    }
}



//MARK: - CollectionView Delegates
extension LocalitiesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.featureLocalities.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.Collection.location
            , for: indexPath) as? LocalitiesCollectionViewCell else {
                return .init()
        }
        
        cell.configure(localities: self.featureLocalities[indexPath.item])
        
        return cell
        
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: 216, height: 226
    //        )
    //    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
    }
    
    
    
    
}

