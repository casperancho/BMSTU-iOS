//
//  main.swift
//  hw1
//
//  Created by Артем Закиров on 09.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import Foundation
enum Currensy: String
{
    case RUR = "RUR"
    case USD = "USD"
    case EUR = "EUR"
}

protocol PrintProtocol {
    func printinfo()
}

class AccountFather {
    var id : Int
    var balance : Double
    var currensy : Currensy?
    
    init(id: Int, balance: Double, currensy: String){
        self.id = id
        self.balance = balance
        self.currensy = Currensy(rawValue: currensy)
    }
}

class Account : AccountFather,PrintProtocol {
    func printinfo() {
        print("Account:\nid - \(id)\nbalance - \(balance)\ncurrensy - \(currensy?.rawValue ?? "no currensy")\ndescription - \(description)")
    }
    
    var description: String
    var Offer: String?
    init(id: Int, balance: Double, currensy: String, description: String, offer: String? = "default") {
        self.description = description
        self.Offer = offer
        super.init(id: id, balance: balance, currensy: currensy)
    }
}

var account1 = Account(id: 0, balance: 2784284, currensy: "RUR", description: "")
var account2 = Account(id: 1488, balance: 228, currensy: "USD", description: "bit' baklywu mi ne brosuM", offer: "v jopy paZ")

account1.printinfo()
account2.printinfo()
print("\n\n")
//koHec 1zadan


