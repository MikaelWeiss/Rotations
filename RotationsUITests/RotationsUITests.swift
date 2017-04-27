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
        let addButton = app.navigationBars["Groups"].buttons["Add"]
        addButton.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        let textField = element.children(matching: .textField).element
        textField.tap()
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
        addButton.tap()
        textField.tap()
        textField.typeText("asdf")
        
        let saveButton = app.buttons["Save"]
        saveButton.tap()
        doneButton.tap()
        
        
        let asdfStaticText = app.tables.cells.staticTexts["asdf"]
        asdfStaticText.tap()
        
        let rotationsNavigationBar = app.navigationBars["Rotations"]
        rotationsNavigationBar.buttons["Add"].tap()
        textField.tap()
        textField.typeText("say whats up")
        saveButton.tap()
        
        let app2 = app
        app2.pickerWheels["Assignment"].swipeUp()
        textField.tap()
        textField.typeText("mikael")
        saveButton.tap()
        doneButton.tap()
        rotationsNavigationBar.buttons["Edit"].tap()
        
        let tablesQuery = app2.tables
        let mikaelStaticText = tablesQuery.staticTexts["mikael"]
        mikaelStaticText.swipeLeft()
        
        let deleteButton = tablesQuery.buttons["Delete"]
        deleteButton.tap()
        
        let tablesQuery2 = app2.tables
        let SayWhatsUpStaticText = tablesQuery2.staticTexts["so up"]
        SayWhatsUpStaticText.swipeLeft()
        
        let deleteButton2 = tablesQuery2.buttons["Delete"]
        deleteButton2.tap()
        
        
        app.navigationBars["Edit"].buttons["Rotations"].tap()
        rotationsNavigationBar.buttons["Groups"].tap()
        asdfStaticText.swipeLeft()
        deleteButton.tap()
        
        
        
    }
    
}
