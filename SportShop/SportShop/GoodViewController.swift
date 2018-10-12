//
//  GoodViewController.swift
//  SportShop
//
//  Created by Кирилл Володин on 24.09.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import UIKit

final class GoodViewController: UIViewController {

    @IBOutlet weak var goodImageView: UIImageView!
    @IBOutlet weak var goodNameLabel: UILabel!
    @IBOutlet weak var goodCompanyLabel: UILabel!
    @IBOutlet weak var goodPriceLabel: UILabel!
    
    var good: Good!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        goodImageView.image = good.image
        goodNameLabel.text = good.name.uppercased()
        goodCompanyLabel.text = good.company.uppercased()
        goodPriceLabel.text = "$\(good.price)"

        goodCompanyLabel.textColor = UIColor.bluishGrey
        goodImageView.backgroundColor = UIColor.paleGrey

        let gesture = UITapGestureRecognizer(target: self, action: #selector(openInFullScreen))
        goodImageView.addGestureRecognizer(gesture)
    }

    @objc func openInFullScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "FullScreenImageViewController") as? FullScreenImageViewController else { return }
        vc.good = good
        present(vc, animated: true, completion: nil)
    }

    @IBAction func showFullImage(_ sender: Any) {
        openInFullScreen()
    }
}
