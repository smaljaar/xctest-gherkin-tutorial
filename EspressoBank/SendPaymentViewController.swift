//
//  SendPaymentViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 21/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

protocol FlowDelegate {
    func backButtonTapped()
}

class SendPaymentViewController: BaseViewController {
        
    let orchestrator = PaymentFlowOrchestrator.sharedInstance
    
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
                
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            print("send payment will move nil parent")
            orchestrator.state = .transactions
            delegate.backButtonTapped()
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            print("send payment did move nil parent")
            orchestrator.state = .transactions
            delegate.backButtonTapped()
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y >= 0 {
                self.view.frame.origin.y -= 0.2*keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                self.view.frame.origin.y += 0.2*keyboardSize.height
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension SendPaymentViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let _ = textField.text, let amountText = amount.text else {
            return
        }
   
        let _ = orchestrator.validatePaymentParameters(name: name.text, iban: iban.text, amount: Double(amountText), paymentDescription: paymentDescription.text)
        
    }
    
}
