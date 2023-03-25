//
//  SearchViewModel.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 25.03.2023.
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func fetchSearchResults(query: String?)
}

final class SearchViewModel: SearchViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (String)->() = { _ in }
    
    var searchData: SearchResponseModel?
    var searchItem: [Results]?
    
    func fetchSearchResults(query: String? = nil) {
        SearchRequest.shared.searchRequest(query: query ?? "") { [weak self] data in
            guard let self = self else { return }
            if let data = data, let results = data.results {
                self.searchData = data
                self.searchItem = results
                self.didSuccess()
            } else {
                self.didFailure(ErrorType.invalidData.rawValue)
            }
        }
    }
    
}
