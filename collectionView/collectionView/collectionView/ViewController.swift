//
//  ViewController.swift
//  collectionView
//
//  Created by Артем Закиров on 19.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemMenuArray: [Menu] = {
       var blankMenu = Menu()
        blankMenu.name = "Coca-Cola"
        blankMenu.imageName = "kola"
        
        var blankMenu2 = Menu()
        blankMenu2.name = "Starbucks"
        blankMenu2.imageName = "star"
        
        var blankMenu3 = Menu()
        blankMenu3.name = "Starbucks"
        blankMenu3.imageName = "kola"
        
        var blankMenu4 = Menu()
        blankMenu4.name = "Starbucks"
        blankMenu4.imageName = "star"
        
        var blankMenu5 = Menu()
        blankMenu5.name = "Starbucks"
        blankMenu5.imageName = "kola"
        
        var blankMenu6 = Menu()
        blankMenu6.name = "Starbucks"
        blankMenu6.imageName = "star"
        
        var blankMenu7 = Menu()
        blankMenu7.name = "Starbucks"
        blankMenu7.imageName = "kola"
        
        var blankMenu8 = Menu()
        blankMenu8.name = "Starbucks"
        blankMenu8.imageName = "star"
        
        var blankMenu9 = Menu()
        blankMenu9.name = "Starbucks"
        blankMenu9.imageName = "kola"
        
        var blankMenu10 = Menu()
        blankMenu10.name = "Starbucks"
        blankMenu10.imageName = "star"
        
        var blankMenu11 = Menu()
        blankMenu11.name = "Starbucks"
        blankMenu11.imageName = "kola"
        
        var blankMenu12 = Menu()
        blankMenu12.name = "Starbucks"
        blankMenu12.imageName = "star"
        
        var blankMenu13 = Menu()
        blankMenu13.name = "Starbucks"
        blankMenu13.imageName = "star"
        
        var blankMenu14 = Menu()
        blankMenu14.name = "Starbucks"
        blankMenu14.imageName = "star"
        
        return [blankMenu, blankMenu2, blankMenu3, blankMenu4, blankMenu5, blankMenu6, blankMenu7, blankMenu8, blankMenu9, blankMenu10, blankMenu11, blankMenu12, blankMenu13, blankMenu14]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self as! UICollectionViewDataSource
        collectionView.delegate = self as! UICollectionViewDelegate
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            itemCell.menu = itemMenuArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    
}
