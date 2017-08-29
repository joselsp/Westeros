//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Memphis on 28/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

class SeasonViewController: UITableViewController {
    
    let model: [Episode]
    
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Episodes"
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
       
        let cellID = "EpisodeCell"
        
        // Descubrir cuala es el episodio que tenemos que mostrar
        let episode = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // La creo a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizar House -> Cell
        cell?.textLabel?.text = episode.title
        return cell!
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        // Averiguamos cuala es la casa
        let episode = model[indexPath.row]
        
        // la mostramos
        let episodeVC = EpisodeViewController(model: episode)
        navigationController?.pushViewController(episodeVC, animated: true)
    }
}
