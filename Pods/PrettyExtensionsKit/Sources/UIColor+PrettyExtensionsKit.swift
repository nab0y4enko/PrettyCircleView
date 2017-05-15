//
//  UIColor+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/18/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// Generate random color
    public static var random: UIColor {
        return UIColor(red: CGFloat.randomFractional(), green: CGFloat.randomFractional(), blue: CGFloat.randomFractional(), alpha: 1)
    }
}

public extension UIColor {
    
    public convenience init?(hexString: String) {
        var hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if hexString.hasPrefix("#") {
            hexString = hexString.choppedPrefix()
        }
        
        var hexValue: UInt32 = 0
        guard Scanner(string: hexString).scanHexInt32(&hexValue) else {
            return nil
        }
        
        switch hexString.characters.count {
        case 6: // RGB
            self.init(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(hexValue & 0x0000FF) / 255.0,
                      alpha: 1)
        case 8: // RGBA
            self.init(red: CGFloat((hexValue & 0xFF000000) >> 24) / 255.0,
                      green: CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0,
                      blue: CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0,
                      alpha: CGFloat(hexValue & 0x000000FF) / 255.0)
        default:
            print("Invalid hex code string.")
            return nil
        }
    }
    
    public func hexString(includeAlpha: Bool = false) -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        if includeAlpha {
            return String(format: "#%02X%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255), Int(alpha * 255))
        }
        return String(format: "#%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
    }
}

public extension UIColor {
    
    /// rgba color components
    public var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        return getRed(&red, green: &green, blue: &blue, alpha: &alpha) ? (red: red, green: green, blue: blue, alpha: alpha) : nil
    }
}
