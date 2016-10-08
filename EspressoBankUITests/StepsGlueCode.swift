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
        step("I am on the (.*)") {
            XCUIApplication().launch()
        }
        
        step("I tap on the (.*) button on alert with title (.*)") { (matches: [String]) in
            
            XCUIApplication().alerts[matches[1]].buttons[matches[0]].tap()
            
            
        }
        
        step("I tap on element (.*) with value (.*)") { (matches: [String]) in
            let accessibilityIdentifer = matches[1]
            XCUIApplication().descendants(matching: .any)[accessibilityIdentifer].tap()
        }
        
        step("I tap on button (.*)") { (buttonAccId : String) in
            XCUIApplication().buttons[buttonAccId].tap()
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
        
        step("I see the element (.*)") { (match : String) in
            let element = XCUIApplication().descendants(matching: .any)[match]
            XCTAssertTrue(element.exists)
        }
    }
}

extension XCTestCase {
    
    func waitForElementToAppear(element: XCUIElement, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate,
                    evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: 2) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 2 seconds."
                XCTFail(message)
                
//                self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
            }
        }
    }
}
