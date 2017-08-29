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
    
    func setupUI(){
        // Creamos un botón a la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
    
        let members = UIBarButtonItem(title: "Members",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayMembers))
        // Añadimos
        navigationItem.rightBarButtonItems = [members, wiki]
    }
    
    @objc func displayMembers(){
        
        // Creamos el membersVC
        let membersVC = MembersViewController(model: model.sortedMembers())
        
        // LO pusheamos
        navigationController?.pushViewController(membersVC, animated: true)
        
    }
    
    @objc func displayWiki(){
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    func syncViewWithModel() {
        // model -> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        	
        syncViewWithModel()
    }
  
}
