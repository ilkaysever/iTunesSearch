//
//  SearchResponseModel.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

import SwiftUI


// MARK: - SearchResponseModel
struct SearchResponseModel: Codable {
    var resultCount: Int?
    var results: [SearchResult]?
}

// MARK: - Result
struct SearchResult: Codable {
    var screenshotUrls: [String]?
    var artistViewURL: String?
    var artistID: Int?
    var artistName: String?
    var description: String?
    var trackID: Int?
    var sellerName: String?
    var fileSizeBytes: String?
    var screenShots: [ScreenShot]? = nil
    
    enum CodingKeys: String, CodingKey {
        case screenshotUrls
        case artistViewURL = "artistViewUrl"
        case artistID = "artistId"
        case artistName
        case description
        case trackID = "trackId"
        case sellerName
        case screenShots
        case fileSizeBytes
    }
}

struct ScreenShot: Codable {
    var imageData: Data?
}
