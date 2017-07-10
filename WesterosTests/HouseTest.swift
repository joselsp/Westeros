//
//  HouseTest.swift
//  Westeros
//
//  Created by memphis on 08/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTest: XCTestCase {
    
    var starkImage: UIImage!
    var lannisterImage: UIImage!
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var roob: Person!
    var arya: Person!
    var tyrion: Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        lannisterHouse = House(name: "Lannyster", sigil: lannisterSigil, words: "Hear me roar!")
        
        roob = Person(name: "Roob", alias: "The young wold", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        XCTAssertNotNil(starkSigil)
        
        let lannysterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg") , description: "Rampant Lion")
        XCTAssertNotNil(lannysterSigil)
    }
    
    func testAddPerson() {
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: roob)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: tyrion)
    
        XCTAssertEqual(starkHouse.count, 2)
    }
}


