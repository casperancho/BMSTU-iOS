//
//  ViewController.swift
//  alamofire4Omni
//
//  Created by Артем Закиров on 12.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class ViewController: UIViewController {

    
    var menuArray : [Item] = []

    
    @IBOutlet weak var clView: UICollectionView!
    @IBAction func rld(_ sender: Any) {
        clView.reloadData()
    }
    
    func loadData(){
        var new = Item()
        new.photoUrl = "https://m.sportowysklep.pl/media/f1000/2012/reebok/14246/0-buty-reebok-classic-leather-2232.jpg"
        new.name = "2232"
        menuArray.append(new)
        var new1 = Item()
        new1.photoUrl = "https://adilike.kiev.ua/image/cache/catalog/0000bbb/3912-650x650.jpg"
        new1.name = "3912"
        menuArray.append(new1)
        var new2 = Item()
        new2.photoUrl = "https://adilike.kiev.ua/image/cache/catalog/0000bbb/3912-650x650.jpg"
        new2.name = "3912"
        menuArray.append(new2)
        var new3 = Item()
        new3.photoUrl = "https://adilike.kiev.ua/image/cache/catalog/0000bbb/3912-650x650.jpg"
        new3.name = "3912"
        menuArray.append(new3)
        var new4 = Item()
        new4.photoUrl = "https://adilike.kiev.ua/image/cache/catalog/0000bbb/3912-650x650.jpg"
        new4.name = "3912"
        menuArray.append(new4)
        var new5 = Item()
        new5.photoUrl = "https://adilike.kiev.ua/image/cache/catalog/0000bbb/3912-650x650.jpg"
        new5.name = "3912"
        menuArray.append(new5)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clView.dataSource = self as UICollectionViewDataSource
        clView.delegate = self as UICollectionViewDelegate
        let nibname = UINib(nibName: "celll", bundle: nil)
//        clView.register(nibname, forCellWithReuseIdentifier: "menuCell")
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
        print(menuArray)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGFloat {
     return 100
    }
    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell123", for: indexPath) as? cell {
            let item123: Item
            item123 = menuArray[indexPath.row]
            DispatchQueue.main.async {
                Alamofire.request(self.menuArray[indexPath.row].photoUrl).responseImage {
                    response in
                    if let image = response.result.value {
                        itemCell.imageView.image = image
//                        print(image)
                    }
                }
            }
//            Alamofire.request(menuArray[indexPath.row].photoUrl).responseImage {
//                response in
//                if let image = response.result.value {
//                    itemCell.imageView.image = image
//                    print(image)
//                }
//            }
            itemCell.nameLabel.text = item123.name
    
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    
}
