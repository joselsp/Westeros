//
//  Character.swift
//  Westeros
//
//  Created by memphis on 08/07/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import Foundation

final class Person{
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        get {
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String?, house: House) {
        (self.name, self.house, self._alias) = (name, house, alias)
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house)
    }
}

extension Person {
    var fullName: String {
        get {
            return "\(name) \(house.name)"
        }
    }
}

extension Person {
    var proxy: String{
        return "\(name) \(alias) \(house.name)"
    }
    var proxyForComparison: String {
        return name.uppercased()
    }
}

extension Person: Hashable {
    var hashValue: Int{
        get{
            return proxy.hashValue
        }
    }
}

extension Person: Equatable {
    public static func ==(lhs: Person, rhs: Person) -> Bool {
       return lhs.proxy == rhs.proxy
    }
}

extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

