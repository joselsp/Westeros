//
//  EpisodesDelegate.swift
//  Westeros
//
//  Created by Memphis on 28/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

final class EpisodesDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        if let episode = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}
