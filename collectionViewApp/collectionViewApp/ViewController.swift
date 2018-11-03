//
//  ViewController.swift
//  collectionViewApp
//
//  Created by Артем Закиров on 01.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableVIew: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.nameLabel.text = animes[indexPath.row].name
        cell.genreLabel.text = animes[indexPath.row].genre
        cell.episodes_count.text = animes[indexPath.row].episodes_length
        cell.episodes_length.text = animes[indexPath.row].episodes_length
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    var animes = [Anime]()
    
    
    func parseJSON(){
        let path : String = Bundle.main.path(forResource: "usagi", ofType: "json") as! String
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let data = Data(referencing: jsonData!)
        let readableJSON = try! JSON(data: data, options: JSONSerialization.ReadingOptions.mutableContainers)
        
        print(readableJSON)
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        self.parseAnimes(from: readableJSON)
            DispatchQueue.main.async {
                self.tableVIew.reloadData()
                
        }
//        var Name = readableJSON["name"]
//        var type = readableJSON["type"]
//        var episodes = readableJSON["episodes"]
//        var ep_len = readableJSON["episode_length"]
//        var description = readableJSON["description"]
//        var post = Anime(dict: readableJSON)
    }
    
    func parseAnimes(from json: Any){
        guard let postsArray = json as? NSArray else {
            print("Parse error")
            return
        }
        
        var tmp = [Anime]()
        for i in postsArray
        {
            guard let AnimeDict = i as? NSDictionary,
                let one = Anime(dict: AnimeDict) else {continue}
            tmp.append(one)
        }
        self.animes = tmp
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableVIew.dataSource = self
        tableVIew.delegate = self
        parseJSON()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

