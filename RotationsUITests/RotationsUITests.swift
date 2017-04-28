//
//  RotationsUITests.swift
//  RotationsUITests
//
//  Created by Mikael Weiss on 4/26/17.
//  Copyright © 2017 Mikael Weiss. All rights reserved.
//

import XCTest

class RotationsUITests: XCTestCase {
    
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
    
    func testNormalUse() {
        
        
        let app = XCUIApplication()
        app.navigationBars["Groups"].buttons["Add"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        let textField = element.children(matching: .textField).element
        textField.tap()
        textField.typeText("asdf")
        
        let saveButton = app.buttons["Save"]
        saveButton.tap()
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
//        element.children(matching: .other).element.children(matching: .textField).element.tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["asdf"].tap()
        app.navigationBars["Rotations"].buttons["Edit"].tap()
        
        let editNavigationBar = app.navigationBars["Edit"]
        editNavigationBar.buttons["Add"].tap()
        textField.tap()
        textField.typeText("qwerty")
        saveButton.tap()
        app.pickerWheels["Assignment"].swipeUp()
        
        textField.tap()
        textField.typeText("mikael")
        saveButton.tap()
        doneButton.tap()
        editNavigationBar.buttons["Repeats"].tap()
        tablesQuery.buttons["MO"].tap()
        tablesQuery.buttons["SU"].tap()
        tablesQuery.buttons["TU"].tap()
        tablesQuery.buttons["WE"].tap()
        tablesQuery.buttons["TH"].tap()
        tablesQuery.buttons["FR"].tap()
        tablesQuery.buttons["SA"].tap()
        app.navigationBars["Repeats"].buttons["Cancel"].tap()
        tablesQuery.staticTexts["mikael"].swipeLeft()
        let deleteButton2 = tablesQuery.buttons["Delete"]
        deleteButton2.tap()

        let tablesQuery2 = app.tables
        tablesQuery2.staticTexts["qwerty"].swipeLeft()
        
        let deleteButton = tablesQuery2.buttons["Delete"]
        deleteButton.tap()
        app.navigationBars["Edit"].buttons["Rotations"].tap()
        app.navigationBars["Rotations"].buttons["Groups"].tap()
        tablesQuery2.staticTexts["asdf"].swipeLeft()
        deleteButton.tap()
        
        
    }
    
}
