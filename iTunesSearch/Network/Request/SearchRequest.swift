//
//  SearchRequest.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

import Foundation

class SearchRequest {
    
    static let shared = SearchRequest()
    
    func searchRequest(query: String, completion: @escaping (SearchResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)\(Constants.SEARCH_STRING)\(Constants.COUNTRY_PATH)\(query)") else { return }
        NetworkManager.shared.request(type: SearchResponseModel.self, url: url, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        debugPrint(error.localizedDescription)
    }
    
}
