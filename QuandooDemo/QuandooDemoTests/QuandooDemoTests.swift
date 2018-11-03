//
//  QuandooDemoTests.swift
//  QuandooDemoTests
//
//  Created by wyj on 2018/11/2.
//  Copyright © 2018 Alex. All rights reserved.
//

import XCTest
@testable import QuandooDemo

class QuandooDemoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchUserList() {
        let expect = self.expectation(description: "fetch user list")
        NetworkCenter.requestUserList(successBlock: { (response) in
            if response.count > 0 {
                expect.fulfill()
                print("Fetch user list success")
            } else {
                XCTFail("Response back. but empty user list")
            }
        }) { (error) in
            XCTFail("network error")
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                XCTFail("Time out")
            }
        }
    }
    
    func testFetchUserPostWithUserId() {
        let expect = self.expectation(description: "fetch user posts")
        NetworkCenter.requestUserPostWithUserId(userId: 1, successBlock: { (response) in
            if response.count > 0 {
                expect.fulfill()
                print("Fetch user posts success")
            } else {
                XCTFail("Response back. but empty")
            }
        }) { (error) in
            XCTFail("network error")
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                XCTFail("Time out")
            }
        }
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
