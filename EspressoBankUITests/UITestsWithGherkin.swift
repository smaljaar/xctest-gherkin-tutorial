//
//  EspressoBankUITests.swift
//  EspressoBankUITests
//
//  Created by Samuël Maljaars on 02/08/16.
//  Copyright © 2016 Samuël Maljaars. All rights reserved.
//

import XCTest

class UITestsWithGherkin: NativeTestCase {
        
    override class open func path() -> URL? {
        let bundle = Bundle(for: self)
        return bundle.resourceURL?.appendingPathComponent("features/")
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = true
        XCUIApplication().launch()
    }
    
}

