//
//  SearchResponse.swift
//  LSMusic
//
//  Created by Станислав Лемешаев on 15.07.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}
