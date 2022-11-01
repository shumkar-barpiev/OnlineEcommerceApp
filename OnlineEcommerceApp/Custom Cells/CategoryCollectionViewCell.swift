//
//  CategoryCollectionViewCell.swift
//  OnlineEcommerceApp
//
//  Created by User on 23/10/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func generateCategory(_ category: Category){
        nameLabel.text = category.name
        imageView?.image = category.image
    }
     
}
