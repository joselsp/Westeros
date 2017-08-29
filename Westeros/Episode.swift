//
//  Episode.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import Foundation

final class Episode {
    
    let title: String
    let airDate: Date
    weak var season: Season?
    
    init (title: String, season: Season, airDate: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        (self.title, self.season, self.airDate) = (title, season, dateFormatter.date(from:airDate)!)
    }
}

extension Episode {
    var proxyForEquality: String{
        get{
            return "\(title) \(airDate)"
        }
    }
}

extension Episode: Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        return title.hashValue
    }
}

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.airDate < rhs.airDate
    }
}

extension Episode: CustomStringConvertible {
    var description: String {
        return "Episode: \(title) Air Date: \(airDate)"
    }
}
