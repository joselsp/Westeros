//
//  Season.swift
//  Westeros
//
//  Created by Memphis on 27/08/2017.
//  Copyright © 2017 keepcoding. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>

final class Season {
    
    let name: String
    let releaseDate: Date
    private var _episodes: Episodes
    
    init(name: String, releaseDate: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        (self.name, self.releaseDate) = (name, dateFormatter.date(from:releaseDate)!)
        _episodes = Episodes()
    }
}

extension Season {
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard episode.season == self else {
            return
        }
        _episodes.insert(episode)
    }
    
    //Variadic version
    func add(episodes: Episode...){
        for episode in episodes {
            add(episode: episode)
        }
    }
}

extension Season {
    var proxyForEquality: String{
        get {
            return "\(name) \(releaseDate)"
        }
    }
}

extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.releaseDate < rhs.releaseDate
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        return "Season: \(name) ReleaseDate: \(releaseDate)"
    }
}

extension Season {
    // Sorted [Episode]
    func sortedEpisodes() -> [Episode]{
        return _episodes.sorted()
    }
}
