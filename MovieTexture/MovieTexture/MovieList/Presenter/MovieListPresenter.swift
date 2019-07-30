//
//  MovieListMovieListPresenter.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//
import Foundation
import ReactiveSwift

class MovieListPresenter: MovieListModuleInput, MovieListViewOutput {

    weak var view: MovieListViewInput!
    var interactor: MovieListInteractorInput!
    var router: MovieListRouterInput!

    private var currentPage: Int = 1
    private var viewModel: MovieListViewModel!
    lazy var params: DiscoverMediaParameters = {
       let params = DiscoverMediaParameters()
        params.page = 1
        params.genres = [28]
        return params
    }()
    
    func viewIsReady() {
        viewModel = MovieListViewModel()
        let output = viewModel.nextPageSignal.output
        output.observeValues { () in
            self.nextPage()
        }
        
        
        
        interactor?.fetchMovies(params: params)
        view?.setupInitialState(viewModel: viewModel)
    }

    func updateViewModel(with movies: [DTOMovie]) {
        var newItems: [MovieListItemViewModel] = []
        movies.forEach { (movie) in
            let imageURL = movie.posterPath?.url(size: EPosterSize.w342)
            let description = movie.overview ?? ""
            let name = movie.originalTitle
            let cellViewModel = MovieListItemViewModel(imageURL: imageURL,
                                                       description: description,
                                                       name: name ?? "")
            newItems.append(cellViewModel)
        }
        viewModel.items.append(contentsOf: newItems)
    }
    
    private func nextPage() {
        params.page += 1
        interactor?.fetchMovies(params: params)
    }
}

extension MovieListPresenter: MovieListInteractorOutput {
   
    func onFetchedDiscoverMedia(_ media: DTODiscoverMedia) {
        updateViewModel(with: media.results ?? [])
    }
    
    func onError(_ error: Error?) {
        print(error?.localizedDescription ?? "unknown error")
    }
    
    func onComplete() {
        print("on complete request")
    }
    
    
    
    
}
