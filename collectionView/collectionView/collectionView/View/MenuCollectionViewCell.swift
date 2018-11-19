//
//  MenuCollectionViewCell.swift
//  collectionView
//
//  Created by Артем Закиров on 19.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var menu : Menu?{
        didSet {
            nameLabel.text = menu?.name
            if let image =  menu?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
