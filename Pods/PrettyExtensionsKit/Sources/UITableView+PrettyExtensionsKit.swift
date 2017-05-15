//
//  UITableView+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/10/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import CoreGraphics

public extension UITableView {

    public func indexPathForCell(whichContains view: UIView?) -> IndexPath? {
        let convertedOriginPoint = convert(CGPoint(), from: view)
        return indexPathForRow(at: convertedOriginPoint)
    }
}
