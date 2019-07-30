//
//  MovieListItemCellNode.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class MovieListItemCellNode: ASCellNode {
    
    fileprivate let movieImageNode: ASNetworkImageNode
    fileprivate let movieNameTextNode: ASTextNode
    fileprivate let movieDescriptionTextNode: ASTextNode
    fileprivate let gradientNode: GradientNode
    
    private let viewModel: MovieListItemViewModel!
    
    init(viewModel: MovieListItemViewModel) {
        self.viewModel = viewModel
        
        movieImageNode = ASNetworkImageNode()
        movieNameTextNode        = ASTextNode()
        movieDescriptionTextNode = ASTextNode()
        gradientNode = GradientNode()
        
        super.init()
        
        backgroundColor = UIColor.lightGray
        clipsToBounds = true
        
        //Movie Image
        movieImageNode.url = viewModel.imageURL
        movieImageNode.clipsToBounds = true
        movieImageNode.delegate = self
        movieImageNode.placeholderFadeDuration = 0.15
        movieImageNode.contentMode = .scaleAspectFill
        movieImageNode.shouldRenderProgressImages = true
        
        //Movie Name
        movieNameTextNode.attributedText = NSAttributedString.forTitleText(viewModel.name)
        movieNameTextNode.placeholderEnabled = true
        movieNameTextNode.placeholderFadeDuration = 0.15
        movieNameTextNode.placeholderColor = UIColor(white: 0.777, alpha: 1.0)
        
        //Movie Description
        movieDescriptionTextNode.attributedText = NSAttributedString.forDescriptionText(viewModel.description)
        movieDescriptionTextNode.truncationAttributedText = NSAttributedString(string: "…")
        movieDescriptionTextNode.backgroundColor = UIColor.clear
        movieDescriptionTextNode.placeholderEnabled = true
        movieDescriptionTextNode.placeholderFadeDuration = 0.15
        movieDescriptionTextNode.placeholderColor = UIColor(white: 0.777, alpha: 1.0)
        
        //Gradient Node
        gradientNode.isLayerBacked = true
        gradientNode.isOpaque = false
        
        addSubnode(movieImageNode)
        addSubnode(gradientNode)
        
        addSubnode(movieNameTextNode)
        addSubnode(movieDescriptionTextNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let ratio = CGFloat(1.44);
        
        // Image with gradient
        
        let imageRatioSpec = ASRatioLayoutSpec(ratio: ratio,
                                               child: movieImageNode)
        
        let gradientOverlaySpec = ASOverlayLayoutSpec(child: imageRatioSpec,
                                                      overlay: gradientNode)
        
        // Vertical stack with movie name and description
        
        let stackSpec = ASStackLayoutSpec(direction: .vertical,
                                          spacing: 0,
                                          justifyContent: .start,
                                          alignItems: .start,
                                          children: [movieNameTextNode, movieDescriptionTextNode])
        
        let relativeStackSpec = ASRelativeLayoutSpec(horizontalPosition: .start,
                                                     verticalPosition: .end,
                                                     sizingOption: [],
                                                     child: stackSpec)
        
        let stackEdgeInsets =  UIEdgeInsets(top: 0,
                                           left: 16,
                                           bottom: 16,
                                           right: 16)
        let finalStackSpec = ASInsetLayoutSpec(insets: stackEdgeInsets,
                                              child: relativeStackSpec)
        
        
        
        // Final spec
        
        let finalSpec = ASOverlayLayoutSpec(child: gradientOverlaySpec,
                                            overlay: finalStackSpec)
        
        
        
        //        let nameEdgeInsets =  UIEdgeInsets(top: 0,
        //                                           left: 0,
        //                                           bottom: 0,
        //                                           right: 0)
        //        let nameInsetSpec = ASInsetLayoutSpec(insets: nameEdgeInsets,
        //                                              child: relativeSpec)
        
        //let nameOverlaySpec = ASOverlayLayoutSpec(child: gradientOverlaySpec, overlay: nameInsetSpec)
        
        //        let descriptionEdgeInsets = UIEdgeInsets(top: 0,
        //                                                 left: 16.0,
        //                                                 bottom: 12.0,
        //                                                 right: 28.0)
        //        let descriptionTextInsetSpec = ASInsetLayoutSpec(insets: descriptionEdgeInsets,
        //                                                         child: movieDescriptionTextNode)
        
        // let descriptionOverlaySpec = ASOverlayLayoutSpec(child: nameOverlaySpec, overlay: descriptionTextInsetSpec)
        
        //        let verticalStackSpec = ASStackLayoutSpec(direction: .vertical,
        //                                                  spacing: 0,
        //                                                  justifyContent: .start,
        //                                                  alignItems: .start,
        //                                                  children: [descriptionOverlaySpec])
        
        //        let backgroundLayoutSpec = ASBackgroundLayoutSpec(child: verticalStackSpec,
        //                                                          background: backgroundImageNode)
        
        return finalSpec
    }
}

// MARK: - ASNetworkImageNodeDelegate

extension MovieListItemCellNode: ASNetworkImageNodeDelegate {
    func imageNode(_ imageNode: ASNetworkImageNode, didLoad image: UIImage) {
        // movieImageNode.image = image
    }
}
