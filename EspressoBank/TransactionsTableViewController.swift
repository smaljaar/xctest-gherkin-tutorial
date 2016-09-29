//
//  TransactionsTableViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit


class TransactionsTableViewController: UITableViewController {

    let transactions = PaymentHistory.sharedInstance.payments
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        return cell
    }
}

extension TransactionsTableViewController {
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
}
