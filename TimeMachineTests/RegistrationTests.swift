//
//  RegistrationTests.swift
//  TimeMachineTests
//
//  Created by Matt Tian on 31/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import TimeMachine

class RegistrationTests: XCTestCase {
    
    var sut: Registration<String>!
    
    override func setUp() {
        super.setUp()
        
        sut = Registration(object: "Hello Swift", expiredDate: Date())
    }
    
    func testInit() {
        let object = sut.object
        let expiredDate = sut.expiredDate
        
        XCTAssertEqual(object, "Hello Swift")
        XCTAssertEqual(expiredDate.timeIntervalSinceNow, Date().timeIntervalSinceNow, accuracy: 0.1)
    }
    
}
