//
//  PaymentFlowViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 30/09/2016.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class PaymentFlowViewController: UIViewController {
    let orchestrator = PaymentFlowOrchestrator.sharedInstance
    let history = PaymentHistory.sharedInstance
    
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var paymentFlowButton: UIButton!
    
    @IBAction func tapNext(_ sender: UIButton) {
        
        var vcToShow: UIViewController!
        
        switch orchestrator.state {
        case .payment:
            
            if orchestrator.paymentToConfirm.count == 0 {
                let alert = UIAlertController(title: "Payment not valid", message: "Check what ya entered yo", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                show(alert, sender: nil)
                return
            } else {
                orchestrator.state = .confirmation
                vcToShow = storyboard!.instantiateViewController(withIdentifier: "confirmationVC")
            }
            
        case .confirmation:
            
            //here we could check a PIN code or so.
            
            orchestrator.state = .transactions
            
            history.payments.append(orchestrator.paymentToConfirm.last!)
            orchestrator.paymentToConfirm.removeAll()
            
            vcToShow = storyboard!.instantiateViewController(withIdentifier: "transactionVC")
            
        case .transactions:
            orchestrator.state = .payment
            
            vcToShow = storyboard!.instantiateViewController(withIdentifier: "paymentVC")
            
        }
        
        orchestrator.paymentNavigation.show(vcToShow, sender: nil)
        
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Balance
        let currentBalance = PaymentHistory.sharedInstance.currentBalance
        accountBalance.text = "€ \(currentBalance.description)"
        
        accountBalance.accessibilityIdentifier = "accountBalance"
        
        //Button
        paymentFlowButton.setTitleColor(#colorLiteral(red: 0.2745098039, green: 0.3529411765, blue: 0.3921568627, alpha: 1), for: .normal)
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)
        paymentFlowButton.accessibilityIdentifier = paymentFlowButton.titleLabel?.text
        
    }
    
}



