//
//  Cache.swift
//  TimeMachine
//
//  Created by Matt Tian on 31/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

class Cache<T> {
    
    private var registrations = [String: Registration<T>]()
    private var userDefaults = UserDefaults.standard
    
    private let expiredDate: Date
    private let dateGenerator: () -> Date
    
    init(expiredDate: Date = Date().addingTimeInterval(60 * 60 * 24 * 7), dateGenerator: @escaping () -> Date = Date.init) {
        self.expiredDate = expiredDate
        self.dateGenerator = dateGenerator
    }
    
    func cache(_ object: T, forKey key: String) {
        registrations[key] = Registration(object: object, expiredDate: expiredDate)
    }
    
    func object(forKey key: String) -> T? {
        guard let registration = registrations[key] else {
            return nil
        }
        
        let currentDate = dateGenerator()
        guard registration.expiredDate >= currentDate else {
            return nil
        }
        
        return registration.object
    }
    
}
