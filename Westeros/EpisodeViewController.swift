//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    let model: Episode
    
    @IBOutlet weak var episodeNameView: UILabel!
    @IBOutlet weak var seasonNameView: UILabel!
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func syncViewWithModel() {
        episodeNameView.text = model.title
        seasonNameView.text = "\(model.season?.name ?? "season name not found")"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

}
