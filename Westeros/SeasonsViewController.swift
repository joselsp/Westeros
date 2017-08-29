//
//  SeasonsViewController.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

class SeasonsViewController: UITableViewController {
    
    let model: [Season]
    
    init(model: [Season]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Game of Thrones Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "SeasonCell"
        
        let season = model[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }        
        
        cell?.textLabel?.text = "\(season)"

        return cell!
    }

}
