//
//  Float+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/11/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

public extension Float {
    
    ///Generate random float between 0 and 1
    public static func randomFractional() -> Float {
        let upperBound = UInt32.max
        let floatUpperBound = Float(upperBound)
        let floatRandom = Float(arc4random_uniform(upperBound))
        return floatRandom / floatUpperBound
    }
    
    public static func randomWithoutFractional(_ range: ClosedRange<Int>) -> Float {
        return Float(Int.random(range))
    }
    
    public static func random(_ range: ClosedRange<Int>) -> Float {
        let lowerBound = range.lowerBound
        let upperBound = range.upperBound
        
        guard lowerBound.distance(to: upperBound) > 0 else {
            return Float(lowerBound)
        }
        
        guard lowerBound.distance(to: upperBound) > 1 else {
            return randomFractional()
        }
        
        return randomWithoutFractional(lowerBound...upperBound-1) + randomFractional()
    }
}
