//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Memphis on 25/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource: ArrayDataSource<Element>
    let arrayDelegate: BaseViewControllerDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>, title: String, style: UITableViewStyle, delegate: BaseViewControllerDelegate<Element>? = nil){
        
        self.dataSource = dataSource
        self.arrayDelegate = delegate
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
        
        arrayDelegate?.viewController = self
        arrayDelegate?.source = dataSource
        
        self.tableView.delegate = arrayDelegate as? UITableViewDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
