//
//  ProductCell.swift
//  hw2
//
//  Created by Артем Закиров on 12.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import UIKit

protocol ProductCellDelegate: class {
    func addToCartTapped(product : Tovar)
}

final class ProductCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    weak var delegate : ProductCellDelegate?
    private var product : Tovar?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageLabel.backgroundColor = UIColor.purple
        descLabel.textColor  = .black
    }
    
    func configureView(product : Tovar)
    {
        self.product = product
        imageLabel.image = product.image
        nameLabel.text = product.name
        descLabel.text = product.desc
        priceLabel.text = "$\(product.price)"
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
