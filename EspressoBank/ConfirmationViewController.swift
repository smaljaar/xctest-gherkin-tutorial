//
//  ConfirmationViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 21/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    let history = PaymentHistory.sharedInstance
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iban: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var paymentDescription: UILabel!
    
    @IBAction func confirmPay(_ sender: AnyObject) {
        history.currentBalance -= (history.payments.last?.amount)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        name.text = history.payments.last?.name
        iban.text = history.payments.last?.iban
        amount.text = history.payments.last?.amount.description
        paymentDescription.text = history.payments.last?.paymentDescription
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
