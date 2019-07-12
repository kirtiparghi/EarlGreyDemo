//
//  EarlGreyDemoTests.swift
//  EarlGreyDemoTests
//
//  Created by Kirti Parghi on 7/12/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import EarlGrey
import XCTest

@testable import EarlGreyDemo

class EarlGreyDemoTests: XCTestCase {

    func testBasicSelection() {
        // Select the button with Accessibility ID "TestMe".
        // This should throw a warning for "Result of Call Unused."
       _ = EarlGrey.selectElement(with: grey_accessibilityID("TestMe"))
    }
    
    func testBasicSelectionAndAction() {
        // Select and tap the button with Accessibility ID "TestMe".
        EarlGrey.selectElement(with: grey_accessibilityID("TestMe"))
            .perform(grey_tap())
    }
    
    func testBasicSelectionAndAssert() {
        // Select the button with Accessibility ID "TestMe" and assert it's visible.
        EarlGrey.selectElement(with: grey_accessibilityID("TestMe"))
            .assert(grey_sufficientlyVisible())
    }
    
    func testBasicSelectionActionAssert() {
        // Select and tap the button with Accessibility ID "TestMe", then assert it's visible.
        EarlGrey.selectElement(with: grey_accessibilityID("TestMe"))
            .perform(grey_tap())
            .assert(grey_sufficientlyVisible())
    }
    
    func testButtonClickWithErrorHandler() {
        var error : NSError?
        EarlGrey.selectElement(with: grey_accessibilityID("TestMe")).perform(grey_tap(), error: &error)
        
        if let _ = error {
            print("Test failed with Error : \(error.self!)")
        }
    }
    
    func testCollectionMatchers() {
        let visibleSendButtonMatcher: GREYMatcher! =
            grey_allOf([grey_accessibilityID("TestMe"), grey_sufficientlyVisible()])
        EarlGrey.selectElement(with: visibleSendButtonMatcher)
            .perform(grey_doubleTap())
    }
    
    func testWithCustomFailureHandler() {
        let myHandler = SampleFailureHandler()
        EarlGrey.setFailureHandler(handler: myHandler)
        EarlGrey.selectElement(with: grey_accessibilityID("TestMe"))
            .perform(grey_tap())
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
class SampleFailureHandler : NSObject, GREYFailureHandler {
    /**
     *  Called by the framework to raise an exception.
     *
     *  @param exception The exception to be handled.
     *  @param details   Extra information about the failure.
     */
    public func handle(_ exception: GREYFrameworkException!, details: String!) {
        print("Test Failed With Reason : \(exception.reason!) and details \(details)")
    }
}
