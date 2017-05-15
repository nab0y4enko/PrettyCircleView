//
//  UIIButton+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/29/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func setBackgroundImage(withColor color: UIColor?, for state: UIControlState) {
        setBackgroundImage(UIImage(withColor: color), for: state)
    }
}
