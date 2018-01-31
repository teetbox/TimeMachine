//
//  TimeMachine.swift
//  TimeMachine
//
//  Created by Matt Tian on 31/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

class TimeMachine {
    
    private var travelledDate = Date()
    
    func travel(by timeInterval: TimeInterval) {
        travelledDate = Date().addingTimeInterval(timeInterval)
    }
    
    func generateDate() -> Date {
        return travelledDate
    }
    
}
