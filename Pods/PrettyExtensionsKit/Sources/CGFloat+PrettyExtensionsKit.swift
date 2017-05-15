//
//  CGFloat+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/18/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import CoreGraphics

public extension CGFloat {
    
    public static func randomFractional() -> CGFloat {
        let randomFractional = CGFloat.NativeType.randomFractional()
        return CGFloat(randomFractional)
    }
    
    public static func randomWithoutFractional(_ range: ClosedRange<Int>) -> CGFloat {
        let randomWithoutFractional = CGFloat.NativeType.randomWithoutFractional(range)
        return CGFloat(randomWithoutFractional)
    }
    
    public static func random(_ range: ClosedRange<Int>) -> CGFloat {
        let random = NativeType.random(range)
        return CGFloat(random)
    }
}
