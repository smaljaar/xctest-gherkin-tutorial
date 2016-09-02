//
//  TransactionCell.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var beneficiaryName: UILabel!
    
    @IBOutlet weak var iban: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
