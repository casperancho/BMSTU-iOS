//
//  ViewController.swift
//  hw2
//
//  Created by Артем Закиров on 12.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let cellId = "ProductCell"
    private let segueName = "toTovar"
    private let addCell = "newAddYotaTableViewCell"
   
    var model = FeedMode()
    var k: Int = 0
    private let estimatedRowHeight: CGFloat = 136
    
    // количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.tovars.count+model.tovars.count/2+1
    }
    
    // создание ячейки в строке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if((indexPath.row % 3) != 0){
            guard let cell = tableview.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductCell else {
                return UITableViewCell()
            }
            let x = (indexPath.row)/3 + 1
            cell.configureView(product: model.tovars[indexPath.row - x])
            return cell
        }else{
            let cell = tableview.dequeueReusableCell(withIdentifier: addCell, for: indexPath) as! newAddYotaTableViewCell
            return cell
        }
    }
    // создание segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ((indexPath.row % 3) != 0){
            let x = (indexPath.row)/3 + 1
        let tovar = model.tovars[indexPath.row - x]
        performSegue(withIdentifier: segueName, sender: tovar)
        }
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func configureTableView()
    {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = estimatedRowHeight
        tableview.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableview.register(UINib(nibName: addCell, bundle: nil), forCellReuseIdentifier: addCell)
        
    }
    
    @IBAction func close(_ sender: Any) {
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            guard
                let vc = segue.destination as? TovarViewController,
                let tovar = sender as? Tovar
                else { return }
            vc.tovar = tovar
        }
    }
}

//if ((indexPath.row%3 == 0){
//    let cell = tableview.dequeueReusableCell(withIdentifier: addCell, for: indexPath) as? newAddYotaTableViewCell
//    return cell!
//    }else{
//
//    let cell = tableview.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductCell
//    cell?.configureView(product: model.tovars[k])
//    k=k+1
//    return cell!
//}



