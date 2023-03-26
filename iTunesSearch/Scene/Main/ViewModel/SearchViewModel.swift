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
    
    func fetchSearchResults(query: String? = nil) {
        SearchRequest.shared.searchRequest(query: query ?? "") { [weak self] data in
            guard let self = self else { return }
            if let data = data, let results = data.results {
                self.searchData = data
                self.searchItem = results
                self.mapData()
                self.didSuccess()
            } else {
                self.didFailure(ErrorType.invalidData.rawValue)
            }
        }
    }
    
    func mapData() {
        searchItem?.enumerated().forEach {
            var screenShots: [ScreenShot] = []
            $1.screenshotUrls?.forEach { url in
                DispatchQueue.background(background: {
                    // do something in background
                    if let data = try? Data(contentsOf: URL(string: url)!) {
                        screenShots.append(.init(imageData: data))
                        self.convertByteToKiloBytes(byte: data.count)
                        //debugPrint(data.count)
                    }
                }, completion:{
                    // when background job finished, do something in main thread
                })
            }
            self.searchItem?[$0].screenShots = screenShots
        }
    }
    
    @discardableResult func convertByteToKiloBytes(byte: Int?) -> Int {
        guard let byte = byte else { return 0 }
        let kBytes = byte / 1024
        
        switch kBytes {
        case 0...100:
            debugPrint("Düşük Çözünürlük" + " - " + "\(kBytes)_kilobytes")
        case 100...250:
            debugPrint("Orta Çözünürlük" + " " + "\(kBytes)_kilobytes")
        case 250...500:
            debugPrint("Yüksek Çözünürlük" + " " + "\(kBytes)_kilobytes")
        default:
            debugPrint("Çok Yüksek Çözünürlük" + " " + "\(kBytes)_kilobytes")
        }
        
        return kBytes
    }
    
}

//1. Search bar’a yazılacak search key’i ile -performans kriterlerinize göre- anlık arama yapılarak sonuçlar listelenmeli.
//
//2. Response içerisindeki tüm itemların screenshotUrls listesinin içerisindeki tüm imajlar download edilmeli.
//
//3. Download işlemi aynı anda maksimum 3 thread olmak üzere concurent yapılmalı.
//
//4. Bir imajın download işlemi biter bitmez UI’da kendi boyutuna uygun grubun altında görüntülenmeli.
//
//5. Ekrandaki imaj listesi imaj boyutuna göre gruplu sectionlar halinde olmalı. (0-100kb, 100-250kb, 250-500kb, 500+kb olmak üzere 4 section olmalı)
//
//6. Kullanıcı bir imaja tıklarsa preview olarak imajın büyük hali bir başka controller aracılığıyla present edilmeli.
//
//7. BONUS: Unit Test yazılmalı.


//load -> search -> search data
//
//search data -> 8 screenshot
//-> a download -> process -> ui
//-> b download -> process -> ui
//-> c download -> process -> ui
//
//a -> 1
//b -> 0. section


// a -> data ap -> data
