//
//  CharacterTest.swift
//  Westeros
//
//  Created by memphis on 08/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {
        
        XCTAssertNotNil(ned)
    }
    
    func testFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
}
