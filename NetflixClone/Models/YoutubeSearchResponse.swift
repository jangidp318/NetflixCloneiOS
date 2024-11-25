//
//  YoutubeSearchResults.swift
//  NetflixClone
//
//  Created by Sharmaji on 22/11/24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id:  IdVideoElement
}

struct IdVideoElement: Codable {
    let videoId: String?
    let kind: String
    let playlistId: String?
}
