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
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TransactionsTableViewController: UITableViewDataSource {
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return transactions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuse = "resuseId"
        
        tableView.registerNib(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: reuse)
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuse, forIndexPath: indexPath) as! TransactionCell
        

        // Configure the cell...
        
        cell.beneficiaryName.text = transactions[indexPath.row].name
        cell.iban.text = transactions[indexPath.row].iban
        cell.amount.text = transactions[indexPath.row].amount.stringValue
        
        return cell
    }
}

extension TransactionsTableViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 66.0
    }
}
