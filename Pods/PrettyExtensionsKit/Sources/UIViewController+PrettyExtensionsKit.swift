//
//  UIViewController+PrettyExtensionsKit.swift
//  PrettyExtensionsKit
//
//  Created by Oleksii Naboichenko on 12/25/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit
import QuartzCore

public extension UIViewController {
    
    public final func animatedPresent(_ viewControllerToPresent: UIViewController, transition: CATransition, completion: (() -> Swift.Void)? = nil) {
        view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: completion)
    }
    
    public final func dismiss(withTransition transition: CATransition, completion: (() -> Swift.Void)? = nil) {
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: completion)
    }
}
