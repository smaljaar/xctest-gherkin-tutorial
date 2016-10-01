//
//  TransactionViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        PaymentFlowOrchestrator.sharedInstance.paymentNavigation = navigationController
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
