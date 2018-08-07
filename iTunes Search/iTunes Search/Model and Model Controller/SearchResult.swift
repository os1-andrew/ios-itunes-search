//
//  SearchResult.swift
//  iTunes Search
//
//  Created by Andrew Liao on 8/7/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

struct SearchResult: Codable{
   
    var title: String
    var creator: String
    
    enum CodingKeys: String, CodingKey{
        case title = "trackName"
        case creator = "artistName"
    }
}

struct SearchResults: Codable {
    var results: [SearchResult]
}
