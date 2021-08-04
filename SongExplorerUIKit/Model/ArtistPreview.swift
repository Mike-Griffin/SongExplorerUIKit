//
//  ArtistPreview.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import Foundation

struct ArtistPreview: Codable, Equatable, Identifiable, Hashable {
    let name: String
    let id: Int
    // I don't think that I want the image on the Preview...but I'm doing this to do some testing
    let image: String?
    private enum CodingKeys: String, CodingKey {
        case id, name, image = "image_url"
    }
}

struct ArtistSongResponse: Codable {
    let songs: [SongPreview]
}

struct ArtistSongResult: Codable {
    let response: ArtistSongResponse
}
