//
//  TransactionsTableViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UITableViewController {
    
    let orchestrator = PaymentFlowOrchestrator.sharedInstance
    let transactions = PaymentHistory.sharedInstance.payments
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TransactionsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let payment = transactions[indexPath.row]
        
        var message = ""
        if let descr = payment.paymentDescription {
            message = "Name: \(payment.name)\n IBAN: \(payment.iban)\n Description: \(descr)"
        } else {
            message = "Name: \(payment.name)\n IBAN: \(payment.iban)\n No description was provided."
        }
        
        let alert = UIAlertController(title: "Transaction", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let sendPayment = UIAlertAction(title: "Send payment", style: .default) { alertAction in
            let paymentVC = self.storyboard!.instantiateViewController(withIdentifier: "paymentVC") as! SendPaymentViewController
            let _ = paymentVC.view
            self.orchestrator.paymentFlowVC.flowDataDelegate = paymentVC

            paymentVC.name.text = payment.name
            paymentVC.iban.text = payment.iban
            paymentVC.delegate = self.orchestrator.paymentFlowVC
            
            self.orchestrator.paymentNavigation.show(paymentVC, sender: nil)
            self.orchestrator.state = .payment
            self.orchestrator.paymentFlowVC.paymentFlowButton.setTitle(self.orchestrator.navigationButtonTitle(), for: .normal)
        }
        alert.addAction(cancel)
        alert.addAction(sendPayment)
        
        present(alert, animated: true, completion: nil)
    }
    
}


extension TransactionsTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuse = "resuseId"
        
        tableView.register(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: reuse)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuse, for: indexPath) as! TransactionCell
        
        cell.beneficiaryName.text = transactions[(indexPath as NSIndexPath).row].name
        cell.iban.text = transactions[(indexPath as NSIndexPath).row].iban
        
        let myAmount = transactions[(indexPath as NSIndexPath).row].amount
        var prefix = ""
        if myAmount > 0 {
            prefix = "-"
        } else {
            prefix = "+"
        }
        
        cell.amount.text = "\(prefix) € \(abs(myAmount).description)"
        cell.accessibilityIdentifier = "\(cell.beneficiaryName.text!), \(cell.iban.text!), \(cell.amount.text!)"
        
        return cell
    }
}

extension TransactionsTableViewController {

    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
}
