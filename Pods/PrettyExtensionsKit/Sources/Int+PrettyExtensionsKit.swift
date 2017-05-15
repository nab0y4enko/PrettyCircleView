//
//  Int+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/11/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

public extension Int {

    public static func random(_ range: Range<Int>) -> Int {
        let boundRange: Range<Int> = Int(Int32.min)..<Int(Int32.max)
        let boundedRange = range.clamped(to: boundRange)
        
        let lowerBound = boundedRange.lowerBound
        let upperBound = boundedRange.upperBound

        return Int(arc4random_uniform(UInt32(upperBound - lowerBound))) + lowerBound
    }
    
    public static func random(_ range: ClosedRange<Int>) -> Int {
        let lowerBound = range.lowerBound
        let upperBound = range.upperBound + 1
        
        return random(lowerBound..<upperBound)
    }
}
