//
//  UIAlertController+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 1/3/17.
//  Copyright © 2017 Oleksii Naboichenko. All rights reserved.
//

import Foundation

public extension UIAlertController {
    
    // MARK: - Private Properties
    private static var defaultAlertTitle: String {
        let bundleName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
        return bundleName ?? "Ooops!"
    }
    
    // MARK: - Initializers
    public convenience init(title: String? = defaultAlertTitle, message: String?, actionTitle: String? = nil, actionHandler: ((UIAlertAction) -> Void)? = nil) {
        //Initialize
        self.init(title: title, message: message, preferredStyle: .alert)
        
        //Add default action
        if actionTitle != nil {
            let action = UIAlertAction(title: actionTitle, style: .default, handler: actionHandler)
            addAction(action)
        }
    }
}
