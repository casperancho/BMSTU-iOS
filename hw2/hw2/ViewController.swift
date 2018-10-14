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
  
    private let estimatedRowHeight: CGFloat = 136
    
    // количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = (model.tovars.count)/3
        print(count)
        return model.tovars.count+count
    }
    
    // создание ячейки в строке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ((indexPath.row+1)%3 != 0){
          let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductCell
            cell?.configureView(product: model.tovars[indexPath.row])
        
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: addCell, for: indexPath) as? newAddYotaTableViewCell
//            cell?.configureView(product: model.tovars[indexPath.row])
            return cell!
        }
    }
    // создание segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tovar = model.tovars[indexPath.row]
        performSegue(withIdentifier: segueName, sender: tovar)
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

