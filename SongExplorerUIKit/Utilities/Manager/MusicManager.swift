//
//  MusicService.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import Foundation

struct MusicManager {
    static let shared = MusicManager()
    func search(_ query: String, completed: @escaping (Result<SearchResult, Error>) -> ()) {
        GeniusApiManager.shared.search("kid cudi") { (result: Result<SearchResult, Error>) in
            completed(result)
        }
    }
}
