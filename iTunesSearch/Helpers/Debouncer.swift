//
//  Debouncer.swift
//  iTunesSearch
//
//  Created by İlkay Sever on 26.03.2023.
//

import Foundation

class Debouncer {

    // MARK: - Properties
    private let queue = DispatchQueue.main
    private var workItem = DispatchWorkItem(block: {})
    private var interval: TimeInterval

    // MARK: - Initializer
    init(seconds: TimeInterval) {
        self.interval = seconds
    }

    // MARK: - Debouncing function
    func debounce(action: @escaping (() -> Void)) {
        workItem.cancel()
        workItem = DispatchWorkItem(block: { action() })
        queue.asyncAfter(deadline: .now() + interval, execute: workItem)
    }
    
}
