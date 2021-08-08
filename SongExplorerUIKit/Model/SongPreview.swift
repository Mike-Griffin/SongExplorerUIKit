//
//  SongPreview.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import Foundation

struct SongPreview: Codable, Equatable, Identifiable, Hashable {
    static func == (lhs: SongPreview, rhs: SongPreview) -> Bool {
        return lhs.id == rhs.id
    }
    let title: String
    let artist: ArtistPreview
    // might want this to be a URL instead of String
    let image: String?
    let id: Int
    private enum CodingKeys: String, CodingKey {
        case id, title = "title_with_featured", artist = "primary_artist", image = "header_image_thumbnail_url"
    }
}
