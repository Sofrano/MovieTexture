//
//  MovieListViewModel.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import Foundation
import ReactiveSwift
import AsyncDisplayKit

class MovieListViewModel {
    var items: [MovieListItemViewModel] = [] {
        didSet {
            let newItems = Array(items[oldValue.count ..< items.count])
            onFetchedNewItems(newItems)
        }
    }
    public var nextPageSignal = Signal<Void, Never>.pipe()
    public var nextPage = SignalProducer<Void, Never>(value: ())
    public var onFetchedNewItems: (([MovieListItemViewModel]) -> Void) = { _ in }
}
