//
//  TransactionsTableViewController.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit


class TransactionsTableViewController: UIViewController {

    let transactions = PaymentHistory.sharedInstance.payments
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TransactionsTableViewController: UITableViewDataSource {
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuse = "resuseId"
        
        tableView.registerNib(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: reuse)
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuse, forIndexPath: indexPath) as! TransactionCell
        
        cell.beneficiaryName.text = transactions[indexPath.row].name
        cell.iban.text = transactions[indexPath.row].iban
        cell.amount.text = transactions[indexPath.row].amount.description
        
        return cell
    }
}

extension TransactionsTableViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66.0
    }
}
