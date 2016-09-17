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
        step("I am on the dashboard") {XCTAssertTrue(true)}
//        step("I tap on button "Transfer"") {XCTAssertTrue(true)}
//        step("I see the screen "Transfer"") {XCTAssertTrue(true)}
//        step("I enter "1.10" in the "amount" field") {XCTAssertTrue(true)}
//        step("I enter "<name>" in the "beneficiary" field") {XCTAssertTrue(true)}
//        step("I enter "<account number>" in the "accountnumber" field") {XCTAssertTrue(true)}
//        step("I tap on button "Next"") {XCTAssertTrue(true)}
//        step("I see the screen "Summary"") {XCTAssertTrue(true)}
//        step("I tap on button "Transfer"") {XCTAssertTrue(true)}
//        step("I see the screen "Espresso Bank"") {XCTAssertTrue(true)}
//        step("my test has passed") {XCTAssertTrue(true)}
    }
}
