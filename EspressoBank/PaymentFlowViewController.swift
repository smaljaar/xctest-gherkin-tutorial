//
//  PaymentFlowViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 30/09/2016.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

//TODO Update balance
//

class BaseViewController: UIViewController {
    var delegate: FlowDelegate!
}


class PaymentFlowViewController: UIViewController, FlowDelegate {
    let orchestrator = PaymentFlowOrchestrator.sharedInstance
    let history = PaymentHistory.sharedInstance
    
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var paymentFlowButton: UIButton!
    
    func backButtonTapped() {
        //todo
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)

    }
    
    @IBAction func tapNext(_ sender: UIButton) {
        
        var vcToShow: BaseViewController!
        
        switch orchestrator.state {
        case .payment:
            
            if orchestrator.paymentToConfirm.count == 0 {
                let alert = UIAlertController(title: "Payment not valid", message: "Check what ya entered yo", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                show(alert, sender: nil)
                return
            } else {
                orchestrator.state = .confirmation
                vcToShow = storyboard!.instantiateViewController(withIdentifier: "confirmationVC") as! BaseViewController
            }
            
        case .confirmation:
            
            //here we could check a PIN code or so.
            
            orchestrator.state = .transactions
            
            history.payments.append(orchestrator.paymentToConfirm.last!)
            orchestrator.paymentToConfirm.removeAll()
            
            vcToShow = storyboard!.instantiateViewController(withIdentifier: "transactionVC") as! BaseViewController

            accountBalance.text = "€ \(PaymentHistory.sharedInstance.currentBalance().description)"

            
        case .transactions:
            orchestrator.state = .payment
            
            vcToShow = storyboard!.instantiateViewController(withIdentifier: "paymentVC") as! BaseViewController
            
        }

        vcToShow.delegate = self
        orchestrator.paymentNavigation.show(vcToShow, sender: self)
        
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Balance
        accountBalance.text = "€ \(PaymentHistory.sharedInstance.currentBalance().description)"
        accountBalance.accessibilityIdentifier = "accountBalance"
        
        //Button
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)
        paymentFlowButton.accessibilityIdentifier = paymentFlowButton.titleLabel?.text
        
    }
    
}



