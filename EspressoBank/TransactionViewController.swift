//
//  TransactionViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet weak var accountBalance: UILabel!
    
    @IBOutlet weak var transferButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentBalance = PaymentHistory.sharedInstance.currentBalance
        accountBalance.text = "€ \(currentBalance.description)"
        
        accountBalance.accessibilityIdentifier = "accountBalance"
        navigationItem.hidesBackButton = true
        
        transferButton.accessibilityIdentifier = transferButton.titleLabel?.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
