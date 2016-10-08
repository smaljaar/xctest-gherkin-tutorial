//
//  TransactionViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class TransactionViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        PaymentFlowOrchestrator.sharedInstance.paymentNavigation = navigationController 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            print("will  move nil parent")
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            print("did move nil parent")
        }
    }
}
