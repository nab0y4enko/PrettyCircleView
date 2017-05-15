//
//  UIBarButtonItem +PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 2/7/17.
//  Copyright © 2017 Oleksii Naboichenko. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    
    public var isHidden: Bool {
        get {
            return !isEnabled && tintColor == UIColor.clear
        }
        set {
            tintColor = newValue ? UIColor.clear : nil
            isEnabled = !newValue
        }
    }
}
