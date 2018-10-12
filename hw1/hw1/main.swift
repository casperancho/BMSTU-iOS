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


print("second")

func DataFunc(StringDate:String) -> Date?{
    let dateFormatGet = DateFormatter()
    dateFormatGet.dateFormat = "dd-mm-yyyy"
    return dateFormatGet.date(from: StringDate)
}

class ReissueInfo: PrintProtocol {
    func printinfo() {
        let dateForm = DateFormatter()
        dateForm.dateFormat = "dd---mm---yyyy"
        let dateBar = dateForm.string(from: date!)
        print("Reissue Info: \ndate: \(dateBar) \ninfo: \(info) \nadress: \(adress)\n")
    }
    
    var date : Date?
    var info : String
    var adress : String
    
    init(date: String,info:String, adress: String = "Головной офис") {
        self.date = DataFunc(StringDate: date)
        self.info = info
        self.adress = adress
    }
}

var reissueInfo1 = ReissueInfo(date: "08-07-1998",info: "blooom")
var reissueInfo2 = ReissueInfo(date: "07-08-1999",info: "o4en vajnaya informaciya", adress: "Rio")
reissueInfo1.printinfo()
reissueInfo2.printinfo()
print("\n\n")
//koHec 2zadan

print("third")

class Card: AccountFather, PrintProtocol{
    var reissueInfo : ReissueInfo?
    init(id: Int, balance: Double, currensy: String, reissueInfo: ReissueInfo? = nil) {
        self.reissueInfo = reissueInfo
        super.init(id: id, balance: balance, currensy: currensy)
    }
    func printinfo() {
        print("Card \ncard id: \(id) \nbalance: \(balance) \ncurrency: \(currensy?.rawValue ?? "no currency") \nRessue address:\( reissueInfo?.adress ?? "no reissure")\n")
    }
}

var card1 = Card(id: 98765, balance: 88686868.5, currensy: "RUR", reissueInfo: reissueInfo2)
var card2 = Card(id: 1, balance: 12345445.45646, currensy: "USD")
card1.printinfo()
card2.printinfo()

//koHec 3zadan


print("4th")

class ServerResponse: PrintProtocol {
    var cards : [Card]
    var accounts : [Account]
    func printinfo() {
        print("Server response \ncards \(cards) \naccounts \(accounts)")
    }
    init(cardArray: [Card], accountArray : [Account]) {
        self.cards = cardArray
        self.accounts = accountArray
    }
}

let ac1 = Account(id: 2, balance: 2.0, currensy: "USD", description: "opisanie", offer: "Not Nill offer")
let ac2  = Account(id: 3, balance: 22.8, currensy: "RUB", description: "des")

let acs = [ac1,ac2]

let reissueInfo = ReissueInfo(date: "09-09-1999", info: "hope yeah", adress: "Ne tvoi raion")

let card3 = Card(id: 43, balance: 4545.454, currensy: "EUR")
let card4 = Card(id: 44, balance: 2323.2323, currensy: "USD", reissueInfo: reissueInfo)

let cards = [card3,card4]

let response = ServerResponse(cardArray: cards, accountArray: acs)
var array = [PrintProtocol]()

array.append(contentsOf: cards)
array.append(contentsOf: acs)
array.append(response)

for i in array {
    i.printinfo()
}

