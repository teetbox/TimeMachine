//
//  File.swift
//  TimeMachine
//
//  Created by Matt Tian on 31/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

class Registration<T> {
    
    let object: T
    let expiredDate: Date
    
    init(object: T, expiredDate: Date) {
        self.object = object
        self.expiredDate = expiredDate
    }
    
}
