//
//  PaymentHistory.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 01/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import Foundation

struct Payment {
    var name: String
    var iban: String
    var amount: Double
    var paymentDescription: String?
}


class PaymentHistory {
    //Singleton
    static let sharedInstance = PaymentHistory()
    fileprivate init(){}
    
    func currentBalance() -> Double {
        var myBalance = startBalance
        payments.forEach { myBalance -= $0.amount }
        return myBalance
    }
    
    let startBalance = 100.00
    
    var payments = [
        Payment(name: "Capgemini", iban: "NL99QWEB0987654321", amount: -350.0, paymentDescription: "Expenses Conference"),
        Payment(name: "Starbucks", iban: "NL69INGB0123456789", amount: 5.50, paymentDescription: "Caramel Latte")
    ]
}
