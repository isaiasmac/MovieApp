//
//  MovieAppUITests.swift
//  MovieAppUITests
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import XCTest

class MovieAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.collectionViews/*[[".cells.collectionViews",".collectionViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.otherElements.containing(.image, identifier:"cover_appletv").element.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Now"]/*[[".cells.staticTexts[\"Now\"]",".staticTexts[\"Now\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["TV"].tap()
        tabBarsQuery.buttons["Profile"].tap()
        tabBarsQuery.buttons["Movies"].tap()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Now"]/*[[".cells.staticTexts[\"Now\"]",".staticTexts[\"Now\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        
    }
    
}
