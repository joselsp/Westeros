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
    
    typealias Filter = (House)->Bool
    var houses: [House] {get}
    func house(named: String)->House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory: HouseFactory {
    
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    var houses: [House] {
        get {
            
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Three headed dragon")
            
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark = House(name: "Stark",
                              sigil: starkSigil,
                              words: "Winter is coming!",
                              url: starkURL)
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  url: lannisterURL)
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire & Blood",
                                  url: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime = Person(name: "Jaime", alias: "Kingslayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            // Añadir los personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, jaime, cersei)
            targaryen.add(person: dani)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
}

protocol SigilFactory {
    var sigils: [Sigil] {get}
}

extension LocalFactory: SigilFactory {
    var sigils: [Sigil] {
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        
        return [starkSigil, lannisterSigil]
    }    
}

extension HouseFactory {
    
    func house(named: String) -> House? {
       return houses.first { $0.name.uppercased() == named.uppercased() }
    }
}

protocol SeasonFactory {
    
    typealias FilterSeason = (Season) -> Bool
    var seasons: [Season] {get}
    func seasons(filteredBy: FilterSeason) -> [Season]
}

extension LocalFactory: SeasonFactory {
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    
    var seasons: [Season] {
        
        let seasonOne = Season(name: "Season One", releaseDate: "17-04-2011")
        let seasonTwo = Season(name: "Season Two", releaseDate: "01-04-2012")
        let seasonThree = Season(name: "Season Three", releaseDate: "31-03-2013")
        let seasonFour = Season(name: "Season Four", releaseDate: "06-04-2014")
        let seasonFive = Season(name: "Season Five", releaseDate: "12-04-2015")
        let seasonSix = Season(name: "Season Six", releaseDate: "24-04-2016")
        let seasonSeven = Season(name: "Season Seven", releaseDate: "16-07-2017")
        
        let episodeS01E01 = Episode(title: "Winter is Coming", season: seasonOne, airDate: "17-04-2011")
        let episodeS01E02 = Episode(title: "The Kingsroad", season: seasonOne, airDate: "24-04-2011")
        
        seasonOne.add(episodes: episodeS01E01, episodeS01E02)

        let episodeS02E01 = Episode(title: "The North Remembers", season: seasonTwo, airDate: "01-04-2012")
        let episodeS02E02 = Episode(title: "The Night Lands", season: seasonTwo, airDate: "08-04-2012")
        
        seasonTwo.add(episodes: episodeS02E01, episodeS02E02)
        
        let episodeS03E01 = Episode(title: "Valar Dohaeris", season: seasonThree, airDate: "31-03-2013")
        let episodeS03E02 = Episode(title: "Dark Wings, Dark Words", season: seasonThree, airDate: "07-04-2013")
        
        seasonThree.add(episodes: episodeS03E01, episodeS03E02)
        
        let episodeS0401 = Episode(title: "Two Swords", season: seasonFour, airDate: "06-04-2014")
        let episodeS0402 = Episode(title: "The Lion and the Rose", season: seasonFour, airDate: "13-04-2014")
        
        seasonFour.add(episodes: episodeS0401, episodeS0402)
        
        let episodeS0501 = Episode(title: "The Wars to Come", season: seasonFive, airDate: "12-04-2015")
        let episodeS0502 = Episode(title: "The House of Black and White", season: seasonFive, airDate: "19-04-2015")
        
        seasonFive.add(episodes: episodeS0501, episodeS0502)
        
        let episodeS06E01 = Episode(title: "The Red Woman", season: seasonSix, airDate: "24-04-2016")
        let episodeS06E02 = Episode(title: "Home", season: seasonSix, airDate: "01-05-2016")
        
        seasonSix.add(episodes: episodeS06E01, episodeS06E02)
        
        let episodeS0701 = Episode(title: "Dragonstone", season: seasonSeven, airDate: "16-07-2017")
        let episodeS0702 = Episode(title: "Stormborn", season: seasonSeven, airDate: "23-07-2017")
        
        seasonSeven.add(episodes: episodeS0701, episodeS0702)
        
        return [seasonOne, seasonTwo, seasonThree, seasonFour, seasonFive, seasonSix, seasonSeven]
    }
}
