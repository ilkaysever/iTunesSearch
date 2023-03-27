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
    var searchItem: [CategorizedImage]?
    //var mockData = MockData()
    var debouncer: Debouncer = Debouncer(seconds: 0.3)
    var downloader: Downloader = Downloader()
    
    func fetchSearchResults(query: String? = nil) {
        debouncer.debounce {
            SearchRequest.shared.searchRequest(query: query ?? "") { [weak self] data in
                guard let self = self else { return }
                if let data = data, let results = data.results {
                    self.searchData = data
                    let urlList = self.getURLs(results)
                    self.downloader.retrieve(urlList) { list in
                        self.searchItem = self.filterAndCategorized(list)
                    }
                    self.didSuccess()
                } else {
                    self.didFailure(ErrorType.invalidData.rawValue)
                }
            }
        }
    }
    
    private func filterAndCategorized(_ list: [SearchedImage]) -> [CategorizedImage] {
        let filtered = list.filter {$0.image != nil}
        var categorizedList: [CategorizedImage] = [CategorizedImage(image: [], section: 0), CategorizedImage(image: [], section: 1), CategorizedImage(image: [], section: 2), CategorizedImage(image: [], section: 3)]
        filtered.forEach { element in
            if let image = element.image {
                switch element.size {
                case 0...20:
                    categorizedList[0].image.append(image)
                case 20...40:
                    categorizedList[1].image.append(image)
                case 40...60:
                    categorizedList[2].image.append(image)
                default:
                    categorizedList[3].image.append(image)
                }
            }
        }
        let nonEmptyCategorizedList = categorizedList.filter { !$0.image.isEmpty }
        return nonEmptyCategorizedList
    }
    
    private func getURLs(_ list: [SearchResult]) -> [String] {
        var urlList: [String] = []
        list.forEach { element in
            element.screenshotUrls?.forEach { url in
                urlList.append(url)
            }
        }
        return urlList
    }
    
    //    func mapData() {
    //        searchItem?.enumerated().forEach {
    //            var screenShots: [ScreenShot] = []
    //            $1.screenshotUrls?.forEach { url in
    //                DispatchQueue.background(background: {
    //                    // do something in background
    //                    if let data = try? Data(contentsOf: URL(string: url)!) {
    //                        screenShots.append(.init(imageData: data))
    //                        self.convertByteToKiloBytes(byte: data.count)
    //                        //debugPrint(data.count)
    //                    }
    //                }, completion:{
    //                    // when background job finished, do something in main thread
    //                })
    //            }
    //            self.searchItem?[$0].screenShots = screenShots
    //        }
    //    }
    //
    //    @discardableResult func convertByteToKiloBytes(byte: Int?) -> Int {
    //        guard let byte = byte else { return 0 }
    //        let kBytes = byte / 1024
    //
    //        switch kBytes {
    //        case 0...100:
    //            debugPrint("Düşük Çözünürlük" + " - " + "\(kBytes)_kilobytes")
    //        case 100...250:
    //            debugPrint("Orta Çözünürlük" + " " + "\(kBytes)_kilobytes")
    //        case 250...500:
    //            debugPrint("Yüksek Çözünürlük" + " " + "\(kBytes)_kilobytes")
    //        default:
    //            debugPrint("Çok Yüksek Çözünürlük" + " " + "\(kBytes)_kilobytes")
    //        }
    //
    //        return kBytes
    //    }
    
}

public extension Sequence {
    func categorize<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
}
