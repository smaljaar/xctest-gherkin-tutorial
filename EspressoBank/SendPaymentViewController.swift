//
//  SendPaymentViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 21/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class SendPaymentViewController: UIViewController {

    var payment = Payment(name: "", iban: "", amount: 0, paymentDescription: "")
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var iban: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var paymentDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.delegate = self
        iban.delegate = self
        amount.delegate = self
        paymentDescription.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        PaymentHistory.sharedInstance.payments.append(payment)
    }
}

extension SendPaymentViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        guard let value = textField.text else {
            return
        }
        
        switch textField {
        case name:
            payment.name = value
        case iban:
            payment.iban = value
        case amount:
            if let myValue = Int(value){
                payment.amount = myValue
                
            }
        case paymentDescription:
            payment.paymentDescription = value
        default:
            break;
        }
        
    }
    
}
