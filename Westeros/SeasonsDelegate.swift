//
//  SeasonsDelegate.swift
//  Westeros
//
//  Created by Memphis on 28/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

final class SeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
               
            let dataSource = DataSources.episodeDataSource(model: season.sortedEpisodes())
            let vc = ArrayTableViewController(dataSource: dataSource,
                                              title: "Episodes",
                                              style: .plain,
                                              delegate: EpisodesDelegate())
            nav.pushViewController(vc, animated: true)
        }
    }
}
