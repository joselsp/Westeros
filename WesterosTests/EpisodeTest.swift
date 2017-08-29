//
//  EpisodeTest.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    var episodeOne: Episode!
    var episodeTwo: Episode!
    var seasonOne: Season!
    
    override func setUp() {
        super.setUp()
        
        seasonOne = Season(name: "Season One", releaseDate: "12-01-2011")
        
        episodeOne = Episode(title: "EpisodeOne", season: seasonOne, airDate: "12-01-2011")
        episodeTwo = Episode(title: "EpisodeTwo", season: seasonOne, airDate: "19-01-2011")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence() {
        
        XCTAssertNotNil(episodeOne)
    }
    
    func testEpisodeEquality() {
        // Identidad
        XCTAssertEqual(episodeOne, episodeOne)
        
        
        // Igualdad
        let episode = Episode(title: "EpisodeOne", season: seasonOne, airDate: "12-01-2011")
        XCTAssertEqual(episode, episodeOne)
                
        // Desigualdad
        XCTAssertNotEqual(episodeOne, episodeTwo)
    }
    
    func testEpisodeHastable(){
        XCTAssertNotNil(episodeOne.hashValue)
    }
    
    func testEpisodeComparison() {
        XCTAssertLessThan(episodeOne, episodeTwo)
    }    
}
