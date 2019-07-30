//
//  MovieListMovieListViewController.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class MovieListViewController: UIViewController {

    var output: MovieListViewOutput?
    var viewNode: MovieListDisplayNode!
    
    // MARK: - Constructors
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.viewNode.frame = self.view.bounds
    }
    
}

extension MovieListViewController: MovieListViewInput {
    
    func setupInitialState(viewModel: MovieListViewModel) {
        self.viewNode = MovieListDisplayNode(viewModel: viewModel)
        self.view.addSubnode(viewNode)
    }
    
}
