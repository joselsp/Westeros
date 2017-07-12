//
//  Repository.swift
//  Westeros
//
//  Created by memphis on 12/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import Foundation

final class Repository{
    
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] {get}
}

final class LocalFactory: HouseFactory {
    var houses: [House] {
        get {
            
            // Creamos las casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let lannisterHouse = House(name: "Lannyster", sigil: lannisterSigil, words: "Hear me roar!")
            
            let roob = Person(name: "Roob", alias: "The young wold", house: starkHouse)
            let arya = Person(name: "Arya", house: starkHouse)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
            let cersei = Person(name: "Cersei", house: lannisterHouse)
            
            //Añadir los personajes a las casas
            starkHouse.add(person: roob)
            starkHouse.add(person: arya)
            
            lannisterHouse.add(person: tyrion)
            lannisterHouse.add(person: cersei)
            
            return [starkHouse, lannisterHouse].sorted()
        }
        
    }
}
