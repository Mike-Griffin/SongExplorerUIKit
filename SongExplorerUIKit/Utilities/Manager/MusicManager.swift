//
//  MusicService.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import Foundation

struct MusicManager {
    static let shared = MusicManager()
    func search(_ query: String, completed: @escaping (Result<[SongPreview], Error>) -> ()) {
        GeniusApiManager.shared.search(query) { (result: Result<SearchResult, Error>) in
            switch result {
            case .success(let searchResult):
                let songs = searchResult.response.hits.map({
                    $0.result
                })
                completed(.success(songs))
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
}
