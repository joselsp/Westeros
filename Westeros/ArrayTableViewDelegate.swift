//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Memphis on 25/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate {
    
    typealias Elements = [Element]
    
    let model: Elements
    
    init(model: Elements) {
        self.model = model
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        //Que pasa aqui dentro
        //Indicamos cual es el elemento
        
//        let element = model[indexPath.row]
//        let arrayTVD = UITableViewController()
//        
//        navigationController.p
    }
}
     
