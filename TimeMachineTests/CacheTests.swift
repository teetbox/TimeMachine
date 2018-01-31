//
//  CacheTests.swift
//  TimeMachineTests
//
//  Created by Matt Tian on 31/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import TimeMachine

class CacheTests: XCTestCase {
    
    var sut: Cache<String>!
    
    override func setUp() {
        super.setUp()
        
        sut = Cache()
    }
    
    func testCache() {
        sut.cache("Hello Swift", forKey: "Greeting")
        
        XCTAssertEqual(sut.object(forKey: "Greeting"), "Hello Swift")
    }
    
    func testExpiredCache() {
        let timeMachine = TimeMachine()
        sut = Cache(dateGenerator: timeMachine.generateDate)
        sut.cache("Hello Swift", forKey: "Greeting")
        
        timeMachine.travel(by: 60 * 60 * 24 * 7)
        XCTAssertNil(sut.object(forKey: "Greeting"))
    }
    
    func testExpiredCacheAfterSpecificTime() {
        let timeMachine = TimeMachine()
        sut = Cache(expiredDate: Date().addingTimeInterval(60 * 60), dateGenerator: timeMachine.generateDate)
        sut.cache("60 minutes", forKey: "Time Travel")
        
        timeMachine.travel(by: 60 * 60)
        XCTAssertNil(sut.object(forKey: "Time Travel"))
    }
    
}
