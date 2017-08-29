//
//  SeasonTest.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    
    var seasonOne: Season!
    var seasonTwo: Season!
    var releaseDate: Date!
    
    override func setUp() {
        super.setUp()
        
        seasonOne = Season(name: "Season One", releaseDate: "12-12-2012")
        seasonTwo = Season(name: "Season Two", releaseDate: "19-12-2013")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence() {
        
        XCTAssertNotNil(seasonOne)
    }
    
    func testSeasonEquality() {
        // Identidad
        XCTAssertEqual(seasonOne, seasonOne)
        
        let season = Season(name: "Season One", releaseDate: "12-12-2012")
        // Igualdad
        XCTAssertEqual(season, seasonOne)        
        
        // Desigualdad
        XCTAssertNotEqual(seasonOne, seasonTwo)
    }
    
    func testSeasonHashtable() {
        XCTAssertNotNil(seasonOne.hashValue)
    }
    
    func testSeasonComparison() {
        XCTAssertLessThan(seasonOne, seasonTwo)
    }
}
