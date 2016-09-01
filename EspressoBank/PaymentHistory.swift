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
    var amount: NSNumber
    var paymentDescription: String
}


class PaymentHistory {
    static let sharedInstance = PaymentHistory()

    var payments = [Payment]()
}