//
//  House.swift
//  Westeros
//
//  Created by memphis on 08/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>

final class House{
    
    let	name: String
    let sigil: Sigil
    let words: Words
    let wikiURL : URL
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
        _members = Members()
    }
    
}

final class Sigil{
    
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String){
        (self.description, self.image) = (description, image)
    }
}

extension House{
    var count: Int {
        return _members.count
    }
    
    func add(person: Person) {
        guard person.house == self else {
            return
        }
        _members.insert(person)
    }
    // Variadic version
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    // Sorted [Person]
    func sortedMembers() -> [Person]{
        return _members.sorted()
    }
}

extension House {
    var proxy: String{
        return "\(name) \(sigil.description) \(words)"
    }
    
    var proxyForComparable: String {
        return name.uppercased()
    }
}

extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension House: Hashable {
    
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparable < rhs.proxyForComparable
    }
}


