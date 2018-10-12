//
//  GoodCell.swift
//  SportShop
//
//  Created by Кирилл Володин on 24.09.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import UIKit

protocol GoodCellDelegate: class {
    func addToCartTapped(good: Good)
}

final class GoodCell: UITableViewCell {

    @IBOutlet weak var goodImage: UIImageView!
    @IBOutlet weak var goodName: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var delegate: GoodCellDelegate?
    
    private var good: Good?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        goodImage.backgroundColor = UIColor.paleGrey
        companyName.textColor = UIColor.bluishGrey
    }
    
    func configureView(good: Good) {
        self.good = good
        goodImage.image = good.image
        goodName.text = good.name
        companyName.text = good.company
        price.text = "$\(good.price)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        guard let good = good else { return }
        delegate?.addToCartTapped(good: good)
    }
    
}
