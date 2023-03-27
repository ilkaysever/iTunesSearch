//
//  Downloader.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 26.03.2023.
//

import UIKit
import Kingfisher

final class Downloader {
    
    private var group: DispatchGroup
    
    init() {
        group = DispatchGroup()
    }
    
    func retrieve(_ list: [String], completion: @escaping ([SearchedImage]) -> Void) {
        var imageList: [SearchedImage] = []
        list.forEach { element in
            imageList.append(SearchedImage(image: nil, size: 0))
        }
        list.enumerated().forEach { index, url in
            if let url = URL(string: url) {
                group.enter()
                KingfisherManager.shared.retrieveImage(with: url) { receivedSize, totalSize in
                    imageList[index].size = (Int(totalSize) / 1024)
                } downloadTaskUpdated: { newTask in } completionHandler: { response in
                    switch response {
                    case .success(let result):
                        self.group.leave()
                        imageList[index].image = result.image
                    case .failure:
                        self.group.leave()
                        break
                    }
                }
            }
        }
        group.notify(queue: .main) {
            completion(imageList)
        }
    }
    
}

struct SearchedImage {
    var image: UIImage?
    var size: Int
}

struct CategorizedImage {
    var image: [UIImage]
    var sectionTitle: String {
        switch section {
        case 0:
            return "Düşük Çözünürlük"
        case 1:
            return "Orta Çözünürlük"
        case 2:
            return "Yüksek Çözünürlük"
        default:
            return "Çok Yüksek Çözünürlük"
        }
    }
    let section: Int
}
