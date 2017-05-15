//
//  Date+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 2/16/17.
//  Copyright © 2017 Oleksii Naboichenko. All rights reserved.
//

import Foundation

public extension Date {
    
    public var dateFromCurrentTimeZone: Date {
        let currentTimeZone = TimeZone.current
        let seconds = currentTimeZone.secondsFromGMT(for: self)
        return Date(timeInterval: TimeInterval(seconds), since: self)
    }
    
    public var dateFromGlobalTimeZone: Date {
        let currentTimeZone = TimeZone.current
        let seconds = -currentTimeZone.secondsFromGMT(for: self)
        return Date(timeInterval: TimeInterval(seconds), since: self)
    }
}
