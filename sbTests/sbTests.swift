//
//  sbTests.swift
//  sbTests
//
//  Created by Anjani on 11/11/16.
//  Copyright © 2016 do. All rights reserved.
//

import XCTest
@testable import sb

class sbTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      
        testAPI()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPI()
    {
        let url = URL(string : kHomeUrl)
        let request = URLRequest(url: url!)
        APIManager.sharedInstance.initiateCall(request: request) { (data) in
            XCTAssert(data != nil)
        }
    }
}
