//
//  ConfirmationViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 21/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class ConfirmationViewController: BaseViewController {

    let orchestrator = PaymentFlowOrchestrator.sharedInstance
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iban: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var paymentDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        name.text = orchestrator.paymentToConfirm.last?.name
        iban.text = orchestrator.paymentToConfirm.last?.iban
        amount.text = orchestrator.paymentToConfirm.last?.amount.description
        paymentDescription.text = orchestrator.paymentToConfirm.last?.paymentDescription
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            print("confirmation vc will move nil parent")
            orchestrator.state = .payment
            delegate.backButtonTapped()
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            print("confirmation vc did move nil parent")
            orchestrator.state = .payment
            delegate.backButtonTapped()
        }
    }
}
