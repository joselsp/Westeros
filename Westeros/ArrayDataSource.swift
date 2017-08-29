//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Memphis on 24/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element>: NSObject, UITableViewDataSource {
    
    typealias  Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model: Elements
    private let _cellMaker: CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elt = _model[indexPath.row]
        return _cellMaker(elt, tableView)
    }
    
    func element(atIndexPath indexPath: IndexPath) -> Element{
        return _model[indexPath.row]
    }
    
    func getModel() -> [Element]{
        return _model
    }
}
