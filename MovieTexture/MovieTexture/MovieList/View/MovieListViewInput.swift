//
//  MovieListMovieListViewInput.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

protocol MovieListViewInput: class {

    /**
        @author Dmitriy Safarov
        Setup initial state of the view
    */

    func setupInitialState(viewModel: MovieListViewModel)
    
}
