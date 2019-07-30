//
//  MovieListMovieListInteractor.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

class MovieListInteractor: MovieListInteractorInput {

    weak var output: MovieListInteractorOutput?

    let networkService = DiscoverNetworkService()
    
    func fetchMovies(params: DiscoverMediaParameters) {
        networkService.getDiscoverMedia(params)
            .done { self.output?.onFetchedDiscoverMedia($0) }
            .catch { self.output?.onError($0) }
            .finally { self.output?.onComplete() }
    }
    
}
