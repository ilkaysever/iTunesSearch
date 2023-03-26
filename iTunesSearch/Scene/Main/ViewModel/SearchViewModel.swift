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
    var searchItem: [SearchResult]?
    var mockData = MockData()
    var debouncer: Debouncer = Debouncer(seconds: 0.3)
    var downloader: Downloader = Downloader()
    
    func fetchSearchResults(query: String? = nil) {
        debouncer.debounce {
            SearchRequest.shared.searchRequest(query: query ?? "") { [weak self] data in
                guard let self = self else { return }
                if let data = data, let results = data.results {
                    self.searchData = data
                    self.searchItem = results
//                    let urls = results.compactMap { $0.screenshotUrls }
//                    urls.
//                    
//                    self.downloader.retrieve(urls) { result in
//                        <#code#>
//                    }
                    self.didSuccess()
                } else {
                    self.didFailure(ErrorType.invalidData.rawValue)
                }
            }
        }
    }
    
    func filteredData() {
        var listArr: [Int] = []
        var dusuk: [String] = []
        var orta: [String] = []
        var yuksek: [String] = []
        var cokyuksek: [String] = []
        
        //mockData.imageUrls.forEach {listArr.append($0.imageName ?? "")}
        mockData.imageUrls.forEach { item in
            if let data = try? Data(contentsOf: URL(string: item.imageName ?? "")!) {
                debugPrint(data)
                let kBytes = Int(data.count) / 1024
                debugPrint(kBytes)
                listArr.append(kBytes)
                
                switch kBytes {
                case 0...30:
                    dusuk.append(item.imageName ?? "")
                case 30...45:
                    orta.append(item.imageName ?? "")
                case 45...200:
                    yuksek.append(item.imageName ?? "")
                default:
                    cokyuksek.append(item.imageName ?? "")
                }
            }
        }
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

extension StringProtocol {
    var data: Data { .init(utf8) }
    var bytes: [UInt8] { .init(utf8) }
}


//1. Response içerisindeki tüm itemların screenshotUrls listesinin içerisindeki tüm imajlar download edilmeli.
//
//2. Download işlemi aynı anda maksimum 3 thread olmak üzere concurent yapılmalı.
//
//3. Bir imajın download işlemi biter bitmez UI’da kendi boyutuna uygun grubun altında görüntülenmeli.
//
//4. Ekrandaki imaj listesi imaj boyutuna göre gruplu sectionlar halinde olmalı. (0-100kb, 100-250kb, 250-500kb, 500+kb olmak üzere 4 section olmalı)
