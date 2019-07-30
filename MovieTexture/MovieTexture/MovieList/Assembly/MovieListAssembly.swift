//
//  MovieListAssembly.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import Swinject

class MovieListAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(MovieListInteractor.self) { (_, presenter: MovieListPresenter) in
            let interactor = MovieListInteractor()
            interactor.output = presenter
            return interactor
        }
        
        container.register(MovieListRouter.self) { (_, viewController: MovieListViewController) in
            let router = MovieListRouter()
            //router.transitionHandler = viewController
            return router
        }
        
        container.register(MovieListPresenter.self) { (resolver, viewController: MovieListViewController) in
            let presenter = MovieListPresenter()
            presenter.view = viewController
            presenter.interactor = resolver.resolve(MovieListInteractor.self, argument: presenter)
            presenter.router = resolver.resolve(MovieListRouter.self, argument: viewController)
            return presenter
        }
        
        container.register(MovieListViewController.self) { resolver in
            let viewController = MovieListViewController()
            viewController.output = resolver.resolve(MovieListPresenter.self, argument: viewController)
            return viewController
        }
    }
    
}
