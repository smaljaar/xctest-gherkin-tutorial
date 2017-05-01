//
//  StepsGlueCode.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 17/09/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import Foundation
import XCTest

let app=XCUIApplication()

class Steps : StepDefiner {
    
    override func defineSteps() {
        step("I start the app") {
            app.launch()
        }
        step("I make a transfer") {
            app.descendants(matching:.any)["Transfer"].tap()
            app.descendants(matching:.any)["Name"].tap()
            app.descendants(matching:.any)["Name"].typeText("Yougert")
            app.descendants(matching:.any)["IBAN"].tap()
            app.descendants(matching:.any)["IBAN"].typeText("Melk")
            app.descendants(matching:.any)["Description"].tap()
            app.descendants(matching:.any)["Description"].typeText("Melk")
            app.descendants(matching:.any)["Amount"].tap()
            app.descendants(matching:.any)["Amount"].typeText("13.37")
            app.descendants(matching:.any)["Send Payment"].tap()
            app.descendants(matching:.any)["Confirm Payment"].tap()
        }
        step("I see a transaction") {
            let transaction = app.descendants(matching:.any)["Melk, Melk, - € 13.37"]
            XCTAssertTrue(transaction.isHittable)
        }
        
    }
}
