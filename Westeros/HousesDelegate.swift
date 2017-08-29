//
//  HousesDelegate.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

final class HousesDelegate: BaseViewControllerDelegate<House>,UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
}
