//
//  HouseViewController.swift
//  Westeros
//
//  Created by memphis on 12/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsTextView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    
    let model: House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    //Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        // model -> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }
  
}
