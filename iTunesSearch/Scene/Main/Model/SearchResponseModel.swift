//
//  SearchResponseModel.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

struct SearchResponseModel: Codable {
    
    var items: [City]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
}

struct City: Codable {
    
    var id: Int?
    var name: String?
        
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
}
