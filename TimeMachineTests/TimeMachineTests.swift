//
//  TimeMachineTests.swift
//  TimeMachineTests
//
//  Created by Matt Tian on 30/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import TimeMachine

class TimeMachineTests: XCTestCase {
    
    var sut: TimeMachine!
    
    override func setUp() {
        super.setUp()
        
        sut = TimeMachine()
    }
    
    func testTravel() {
        sut.travel(by: 60 * 60 * 24)
        
        XCTAssertEqual(sut.generateDate().timeIntervalSinceNow, Date().addingTimeInterval(60 * 60 * 24).timeIntervalSinceNow, accuracy: 0.1)
    }
    
}
