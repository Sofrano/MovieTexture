//
//  MovieListDisplayNode.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class MovieListDisplayNode: ASTableNode {
    
    var viewModel: MovieListViewModel
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(style: .grouped)
        self.view.separatorStyle = .none
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
    
    func insertRows(for newViewModels: [MovieListItemViewModel]) {
        let sectionIndex = 0
        let totalNumberOfRows = viewModel.items.count
        let currentNumberOfRows = totalNumberOfRows - newViewModels.count
        var indexPaths = [IndexPath]()
        
        for rowIndex in currentNumberOfRows ..< totalNumberOfRows {
            let path = IndexPath(row: rowIndex, section: sectionIndex)
            indexPaths.append(path)
        }
        
        self.insertRows(at: indexPaths, with: .automatic)
    }
    
}

extension MovieListDisplayNode: ASTableDelegate {

    func tableNode(_ tableNode: ASTableNode,
                   willBeginBatchFetchWith context: ASBatchContext) {
        viewModel.nextPageSignal.input.send(value: ())
        viewModel.onFetchedNewItems = { items in
            self.insertRows(for: items)
            context.completeBatchFetching(true)
        }
    }
    
    func shouldBatchFetch(for tableNode: ASTableNode) -> Bool {
        return true
    }

}

extension MovieListDisplayNode: ASTableDataSource {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellViewModel = viewModel.items[indexPath.row]
        return {
            let cellNode = MovieListItemCellNode(viewModel: cellViewModel)
            return cellNode
        }
    }
    
}
