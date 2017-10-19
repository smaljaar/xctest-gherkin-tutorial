//
//  StepsGlueCode.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 17/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import XCTest
import XCTest_Gherkin

let app = XCUIApplication()

class Steps : StepDefiner {
    
    override func defineSteps() {
        step("I start the app") {
            app.launch()
        }
        step("I make a transfer") {
            app.descendants(matching:.any)["Transfer"].firstMatch.tap()
            
            app.descendants(matching:.any)["Amount"].firstMatch.tap()
            app.descendants(matching:.any)["Amount"].firstMatch.typeText("13.37\n")
            app.descendants(matching:.any)["Name"].firstMatch.tap()
            app.descendants(matching:.any)["Name"].firstMatch.typeText("Yoghurt\n")
            app.descendants(matching:.any)["IBAN"].firstMatch.tap()
            app.descendants(matching:.any)["IBAN"].firstMatch.typeText("NL69INGB0123456789\n")
            
            app.descendants(matching:.any)["Send Payment"].firstMatch.tap()
            
            app.descendants(matching:.any)["Confirm Payment"].firstMatch.tap()
        }
        step("I see a transaction") {
            let transaction = app.descendants(matching:.any)["- € 13.37"].firstMatch
            XCTAssertTrue(transaction.isHittable)
        }
        
    }
}
