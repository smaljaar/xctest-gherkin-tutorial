//
//  StepsGlueCode.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 17/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import Foundation
import XCTest

let app = XCUIApplication()

class Steps : StepDefiner {
    
    override func defineSteps() {
        step("I start the app") {
            app.launch()
        }
        step("I make a transfer") {
            app.descendants(matching:.any)["Transfer"].tap()
            
            app.descendants(matching:.any)["Amount"].tap()
            app.descendants(matching:.any)["Amount"].typeText("13.37\n")
            app.descendants(matching:.any)["Name"].tap()
            app.descendants(matching:.any)["Name"].typeText("Yoghurt\n")
            app.descendants(matching:.any)["IBAN"].tap()
            app.descendants(matching:.any)["IBAN"].typeText("NL69INGB0123456789\n")
            
            app.descendants(matching:.any)["Send Payment"].tap()
            
            app.descendants(matching:.any)["Confirm Payment"].tap()
        }
        step("I see a transaction") {
            let transaction = app.descendants(matching:.any)["- € 13.37"]
            XCTAssertTrue(transaction.isHittable)
        }
        
    }
}
