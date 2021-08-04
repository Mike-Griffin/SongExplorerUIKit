//
//  GeniusApiManager.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import Foundation

struct GeniusApiManager {
    static let shared = GeniusApiManager()
    func search(_ query: String, completed: @escaping (Result<SearchResult, Error>) -> ()) {
        let noSpaceQuery = query.replacingOccurrences(of: " ", with: "%20")
        let endpoint = "search?q=\(noSpaceQuery)&per_page=3"
        fetch(endpoint) { ( result: Result<SearchResult, Error>) in
            completed(result)
        }
    }
    
    // will want to extract this out to a separate api manager when I add future apis
    func fetch<T: Codable>(_ endPoint: String, completion: @escaping (Result<T, Error>) -> ()) {
        let baseUrl = "https://api.genius.com/"
        let urlString = baseUrl + endPoint
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        if let data = data {
                            do {
                                let decodedData = try JSONDecoder().decode(T.self, from: data)
                                completion(.success(decodedData))
                            } catch {
                                completion(.failure(error))
                            }
                        }
                        else {
                            print("no data")
                            completion(.failure(CustomError.noData))
                        }
                    }
                    else {
                        print("no success code")
                        completion(.failure(CustomError.localizedError(description: response.description)))
                    }
                } else {
                    completion(.failure(CustomError.noResponse))
                }
            }.resume()
        } else {
            print("url string error...should probably be a fatal error i.e. I could just force unwrap")
        }
    }
}
