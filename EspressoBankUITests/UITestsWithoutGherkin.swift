//
//  UITestsWithoutGherkin.swift
//  EspressoBank
//
//  Created by Samuël Maljaars on 05/10/2016.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import Foundation
import XCTest

class SecondFailureTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testWithoutGherkin() {
        app.buttons["Transfer"].tap()
        app.textFields["Name"].tap() //on iOS 9 this is necessary, not on iOS 10 anymore.
        app.textFields["Name"].typeText("This is done without the Gherkin layer")
    }
    
}
