//
//  CustomError.swift
//  SongExplorerUIKit
//
//  Created by Mike Griffin on 8/3/21.
//

import Foundation

enum CustomError: Error {
    case noData
    case noResponse
    case urlStringError
    case localizedError(description: String)
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noData:
            return NSLocalizedString("No data found", comment: "Service data error")
        case .localizedError(let description):
            return description
        case .noResponse:
            return NSLocalizedString("No response found", comment: "HTTP Response error")
        case .urlStringError:
            return NSLocalizedString("Error setting url string", comment: "Url string error")
        }
    }
}
