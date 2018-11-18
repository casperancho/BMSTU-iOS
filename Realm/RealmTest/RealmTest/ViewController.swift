//
//  ViewController.swift
//  RealmTest
//
//  Created by Артем Закиров on 18.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let realm =  try! Realm()
    var cellId = "singleTableCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Cat.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCat = realm.objects(Cat.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! singleTableCell
        cell.go(name: currentCat[indexPath.row].name! , color: currentCat[indexPath.row].color!, gender: currentCat[indexPath.row].gender!)
        return cell
    }
    

    @IBAction func callAlert(_ sender: Any) {
        callAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func callAlert(){
        let alertView = UIAlertController(title: "Adding new info", message: nil, preferredStyle: .alert)
        let add = UIAlertAction(title: "Добавить", style: .default) { (action) in
            self.adding(name: alertView.textFields![0].text as! String, color: alertView.textFields![1].text as! String, gender: alertView.textFields![2].text as! String)
            print("ADD")
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        alertView.addAction(add)
        alertView.addAction(cancel)
        alertView.addTextField { (textfield) in
            textfield.placeholder = "Name"
        }
        alertView.addTextField { (textfield) in
            textfield.placeholder = "Color"
        }
        alertView.addTextField { (textfield) in
            textfield.placeholder = "Gender"
        }
        self.present(alertView, animated: true, completion: {
            print("Alert worked")
            })
    }

    func adding(name: String, color: String, gender: String){
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        let results = realm.objects(Cat.self)
        print(results.count)
        let myCat = Cat()
        myCat.color = color
        myCat.gender = gender
        myCat.name = name
        try! realm.write {
            realm.add(myCat)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editingRow = indexPath.row
        
                let deleteAction = UITableViewRowAction(style: .default, title: "Delete") {_,_ in
                    try! self.realm.write {
                        let curCat = self.realm.objects(Cat.self)
                        self.realm.delete(curCat[editingRow])
                        tableView.reloadData()
                    }
                }
                return [deleteAction]
    }

}

