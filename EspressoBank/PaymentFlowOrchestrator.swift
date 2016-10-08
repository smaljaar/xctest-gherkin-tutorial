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
    
    var paymentNavigation: UINavigationController!
    
    var paymentFlowVC: PaymentFlowViewController!
    
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
            return "Send Payment"
        case .confirmation:
            print(state.hashValue)
            return "Confirm Payment"
        }
    }
    
    var paymentToConfirm: Payment?
    
}
