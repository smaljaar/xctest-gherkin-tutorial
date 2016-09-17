//
//  StepsGlueCode.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 17/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import Foundation
import XCTest

class Steps : StepDefiner {
    
    override func defineSteps() {
        step("I am on the dashboard") {
            XCUIApplication().launch()
        }
        
        step("I tap on button (.*)") { (buttonAccId : String) in
            XCUIApplication().buttons[buttonAccId].tap()
        }
        
        step("I see the screen (.*)") {(screenName: String) in
            print(screenName) 
        }
        
        step("I enter (.*) in the (.*) field") { (matches : [String]) in
            let textToEnter = matches[0]
            let fieldAccId = matches[1]
            
            let field = XCUIApplication().descendants(matching: .any)[fieldAccId]
            field.tap()
            field.typeText(textToEnter + "\n")
        }
        
        step("my test has passed") {
            //done
        }
    }
}
