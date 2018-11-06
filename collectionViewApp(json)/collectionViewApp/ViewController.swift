//
//  ViewController.swift
//  collectionViewApp
//
//  Created by Артем Закиров on 01.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import SwiftyJSON

var cellId = "AnTabCell"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableVIew: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId , for: indexPath) as! AnimeTableCell
        cell.nameLabel.text = animes[indexPath.row].name
    
        cell.genreLabel.text = "Жанр:"+animes[indexPath.row].genre
        cell.episodes_count.text = "Эпизодов:"+animes[indexPath.row].episodes
        cell.episodes_length.text = "Продолжительность:"+animes[indexPath.row].episodes_length
        cell.imageView!.image = animes[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    var animes = [Anime]()
    
    
    func parseJSON(){
    var names : [String] = ["usagi", "gto", "monster", "attack_on_titan"]
        for items in names{
            let pathname = items
            if let path = Bundle.main.path(forResource: pathname , ofType: "json") {
                do {
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: [])
                    let jsonRes = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    if let jsonRes = jsonRes as? Dictionary<String,AnyObject>{
                        print(jsonRes)
                        let Name = jsonRes["name"] as! String
                        let type = jsonRes["type"] as! String
                        let episodes = jsonRes["episodes"] as! String
                        let ep_len = jsonRes["episode_length"] as! String
                        let description = jsonRes["description"] as! String
                        guard let imagPath = Bundle.main.path(forResource: items, ofType: "jpg") else {return}
                        let image  = UIImage(contentsOfFile: imagPath) as! UIImage
                        let tmp = Anime(name: Name, genre: type, episodes: episodes, episodes_length: ep_len, description: description, image: image)
                        
                        self.animes.append(tmp)
                    }
                }
        }
    }
        DispatchQueue.main.async {
            self.tableVIew.reloadData()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.dataSource = self
        tableVIew.delegate = self

        tableVIew.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        parseJSON()
        // Do any additional setup after loading the view, typically from a nib.
    }




}
