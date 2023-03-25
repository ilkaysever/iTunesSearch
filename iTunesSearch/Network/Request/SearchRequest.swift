//
//  SearchRequest.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 24.03.2023.
//

import Foundation

class SearchRequest {
    
    static let shared = SearchRequest()
    
    func requestiTunesSearch(completion: @escaping (SearchResponseModel?) -> ()) {
        //guard let url = URL(string: "\(Constants.BASE_URL)/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        guard let url = URL(string: Constants.BASE_URL) else { return }
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
    
    func requestSearchItems(id: Int, completion: @escaping (Results?) -> ()) {
        //guard let url = URL(string: "\(Constants.BASE_URL)/movie/\(id)?api_key=\(Constants.API_KEY)&language=en-US") else { return }
        guard let url = URL(string: Constants.BASE_URL) else { return }
        NetworkManager.shared.request(type: Results.self, url: url, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func requestSeriesSearch(query: String, completion: @escaping (SearchResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)/search/tv?api_key=\(Constants.API_KEY)&language=en-US&query=\(query)") else { return }
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
