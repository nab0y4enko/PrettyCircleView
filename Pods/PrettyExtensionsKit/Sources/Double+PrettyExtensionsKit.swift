//
//  Double+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/11/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

public extension Double {
    
    ///Generate random double between 0 and 1
    public static func randomFractional() -> Double {
        let upperBound = UInt32.max
        let doubleUpperBound = Double(upperBound)
        let doubleRandom = Double(arc4random_uniform(upperBound))
        return doubleRandom / doubleUpperBound
    }
    
    public static func randomWithoutFractional(_ range: ClosedRange<Int>) -> Double {
        return Double(Int.random(range))
    }
    
    public static func random(_ range: ClosedRange<Int>) -> Double {
        let lowerBound = range.lowerBound
        let upperBound = range.upperBound
        
        guard lowerBound.distance(to: upperBound) > 0 else {
            return Double(lowerBound)
        }
        
        guard lowerBound.distance(to: upperBound) > 1 else {
            return randomFractional()
        }
        
        return randomWithoutFractional(lowerBound...upperBound-1) + randomFractional()
    }
}
