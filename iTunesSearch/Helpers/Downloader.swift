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
        list.enumerated().forEach { index, url in
            if let url = URL(string: url) {
                group.enter()
                KingfisherManager.shared.retrieveImage(with: url) { receivedSize, totalSize in
                    imageList.append(SearchedImage(image: UIImage(), size: Int(totalSize) / 1024))
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

struct SearchedImage {
    var image: UIImage
    var size: Int
}
