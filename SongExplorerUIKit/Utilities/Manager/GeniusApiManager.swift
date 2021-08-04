//
//  GeniusApiManager.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import Foundation

struct GeniusApiManager {
    static let shared = GeniusApiManager()
    func search(_ query: String, completion: @escaping (Result<SearchResult, Error>) -> ()) {
        let noSpaceQuery = query.replacingOccurrences(of: " ", with: "%20")
        let endpoint = "search?q=\(noSpaceQuery)&per_page=3"
        
    }
    
    // will want to extract this out to a separate api manager when I add future apis
    func fetch<T: Codable>(_ endPoint: String, completion: @escaping (Result<T, Error>) -> ()) {
        let baseUrl = "https://api.genius.com/"
        let urlString = baseUrl + endPoint
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField: <#T##String#>)
        } else {
            print("url string error...should probably be a fatal error i.e. I could just force unwrap")
        }
    }
}
