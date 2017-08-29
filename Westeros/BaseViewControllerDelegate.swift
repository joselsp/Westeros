//
//  BaseViewControllerDelegate.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject {
    var source: ArrayDataSource<Element>?
    var viewController: UIViewController?
}
