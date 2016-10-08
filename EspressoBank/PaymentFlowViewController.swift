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

protocol FlowDelegate {
    func backButtonTapped()
    func validatePaymentData(name: String?, iban: String?, amount: String?, paymentDescription: String?)
}

extension PaymentFlowViewController: FlowDelegate {
    
    
    func backButtonTapped() {
        
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)
        PaymentFlowOrchestrator.sharedInstance.paymentToConfirm = nil

    }
    
    func validatePaymentData(name: String?, iban: String?, amount: String?, paymentDescription: String?){
    
        var payment: Payment!
        
        if let name = name, let iban = iban, let amount = amount, let amountDouble = Double(amount), name != "" && iban != "" {
            if let paymentDescription = paymentDescription {
                payment = Payment(name: name, iban: iban, amount: amountDouble, paymentDescription: paymentDescription)
            } else {
                payment = Payment(name: name, iban: iban, amount: amountDouble, paymentDescription: nil)
            }
            PaymentFlowOrchestrator.sharedInstance.paymentToConfirm = payment
        }
    }
}


class PaymentFlowViewController: UIViewController {
    let orchestrator = PaymentFlowOrchestrator.sharedInstance
    let history = PaymentHistory.sharedInstance
        
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var paymentFlowButton: UIButton!

    var flowDataDelegate: FlowPaymentDataDelegate!

    @IBAction func tapNext(_ sender: UIButton) {
        
        var vcToShow: BaseViewController!
        
        switch orchestrator.state {
        case .payment:
            
            let data = flowDataDelegate.data()
            
            validatePaymentData(name: data.name, iban: data.iban, amount: data.amount, paymentDescription: data.paymentDescription)
            
            if orchestrator.paymentToConfirm == nil {
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
            
            history.payments.append(orchestrator.paymentToConfirm!)
            orchestrator.paymentToConfirm = nil
            
            vcToShow = storyboard!.instantiateViewController(withIdentifier: "transactionVC") as! BaseViewController

            accountBalance.text = "€ \(PaymentHistory.sharedInstance.currentBalance().description)"

            
        case .transactions:
            orchestrator.state = .payment
            
            vcToShow = storyboard!.instantiateViewController(withIdentifier: "paymentVC") as! BaseViewController
            flowDataDelegate = vcToShow as! FlowPaymentDataDelegate!
            
        }

        vcToShow.delegate = self
        orchestrator.paymentNavigation.show(vcToShow, sender: self)
        
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orchestrator.paymentFlowVC = self
        
        //Balance
        accountBalance.text = "€ \(PaymentHistory.sharedInstance.currentBalance().description)"
        accountBalance.accessibilityIdentifier = "accountBalance"
        
        //Button
        paymentFlowButton.setTitle(orchestrator.navigationButtonTitle(), for: .normal)
        
    }
    
}



