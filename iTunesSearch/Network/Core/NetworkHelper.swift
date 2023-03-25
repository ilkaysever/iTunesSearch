//
//  NetworkHelper.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

import Foundation

struct Constants {
    static let BASE_URL = "https://itunes.apple.com"
    static let SEARCH_STRING = "/search?media=software"
    static let COUNTRY_PATH = "&country=tr&term="
    static let imgBaseURL = "https://image.tmdb.org/t/p/w500"
}

enum ErrorType: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Inlavid Url"
    case unknownError = "An error unknown"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
}
