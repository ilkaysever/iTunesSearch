//
//  SearchResponseModel.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//


// MARK: - SearchResponseModel
struct SearchResponseModel: Codable {
    var resultCount: Int?
    var results: [Results]?
}

// MARK: - Result
struct Results: Codable {
    var screenshotUrls: [String]?
    var artistViewURL: String?
    var supportedDevices: [String]?
    var releaseNotes: String?
    var artistID: Int?
    var artistName: String?
    var genres: [String]?
    var price: Int?
    var description: String?
    var trackID: Int?
    var trackName: String?
    var sellerName: String?
    var currency: String?
    var fileSizeBytes: String?
    
    enum CodingKeys: String, CodingKey {
        case screenshotUrls
        case artistViewURL = "artistViewUrl"
        case supportedDevices
        case releaseNotes
        case artistID = "artistId"
        case artistName
        case genres
        case price
        case description
        case trackID = "trackId"
        case trackName
        case sellerName
        case currency
        case fileSizeBytes
    }
}
