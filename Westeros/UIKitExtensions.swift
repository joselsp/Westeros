//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by memphis on 12/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}
