//
//  PaymentFlowButton.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 02/10/2016.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import UIKit

class PaymentFlowButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.2745098039, green: 0.3529411765, blue: 0.3921568627, alpha: 1) : #colorLiteral(red: 0.5411764706, green: 0.7803921569, blue: 0.8980392157, alpha: 1)
        }
    }
}
