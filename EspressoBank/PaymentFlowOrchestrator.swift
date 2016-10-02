//
//  PaymentFlowOrchestrator.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 01/10/2016.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import Foundation
import UIKit

class PaymentFlowOrchestrator {
        
    //Singleton
    static let sharedInstance = PaymentFlowOrchestrator()
    fileprivate init(){}
    
    var paymentNavigation: PaymentFlowNavigationController!
    
    var state = PaymentFlowState.transactions
    
    enum PaymentFlowState {
        case transactions, payment, confirmation
    }
    
    func navigationButtonTitle() -> String {
        switch state {
        case .transactions:
            print(state.hashValue)
            return "Transfer"
        case .payment:
            print(state.hashValue)
            return "Send payment"
        case .confirmation:
            print(state.hashValue)
            return "Confirm"
        }
    }
    
    var paymentToConfirm = [Payment]()
    
    func validatePaymentParameters(name: String?, iban: String?, amount: Double?, paymentDescription: String?) -> Bool {
        
        var payment: Payment!
        
        if let name = name, let iban = iban, let amount = amount {
            if let paymentDescription = paymentDescription {
                payment = Payment(name: name, iban: iban, amount: amount, paymentDescription: paymentDescription)
            } else {
                payment = Payment(name: name, iban: iban, amount: amount, paymentDescription: nil)
            }
        } else {
            return false
        }
        
        paymentToConfirm.append(payment)
        return true
    }
}
