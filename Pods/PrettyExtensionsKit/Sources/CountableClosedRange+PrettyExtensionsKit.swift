//
//  CountableClosedRange+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/11/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

public extension CountableClosedRange {
    
    public var randomInt: Int? {
        guard let lowerBound = lowerBound as? Int, let upperBound = upperBound  as? Int else {
            return nil
        }
        
        return Int.random(lowerBound...upperBound)
    }
    
    public var randomDouble: Double? {
        guard let lowerBound = lowerBound as? Int, let upperBound = upperBound  as? Int else {
            return nil
        }
        
        return Double.random(lowerBound...upperBound)
    }

    public var randomFloat: Float? {
        guard let lowerBound = lowerBound as? Int, let upperBound = upperBound  as? Int else {
            return nil
        }
        
        return Float.random(lowerBound...upperBound)
    }
    
    public var randomCGFloat: CGFloat? {
        guard let lowerBound = lowerBound as? Int, let upperBound = upperBound  as? Int else {
            return nil
        }
        
        return CGFloat.random(lowerBound...upperBound)
    }
}
