//
//  MovieListMovieListConfigurator.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import UIKit

class MovieListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MovieListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MovieListViewController) {

        let router = MovieListRouter()

        let presenter = MovieListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MovieListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
