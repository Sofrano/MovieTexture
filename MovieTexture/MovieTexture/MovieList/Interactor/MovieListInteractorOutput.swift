//
//  MovieListMovieListInteractorOutput.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import Foundation

protocol MovieListInteractorOutput: class {
    
    func onFetchedDiscoverMedia(_ media: DTODiscoverMedia)
    func onError(_ error: Error?)
    func onComplete()
    
}
