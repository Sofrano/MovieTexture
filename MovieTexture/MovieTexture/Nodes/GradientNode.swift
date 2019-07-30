//
//  GradientNode.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 29/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class GradientNode: ASDisplayNode {

    override class func draw(_ bounds: CGRect,
                             withParameters parameters: Any?,
                             isCancelled isCancelledBlock: () -> Bool,
                             isRasterizing: Bool) {
//        if let myContext = UIGraphicsGetCurrentContext() {
//            myContext.saveGState()
//            myContext.clip(to: bounds)
//            let componentCount = 2
//
//            let zero: CGFloat = 0.0
//            let one: CGFloat = 1.0
//            let locations: [CGFloat] = [zero, one]
//            let components: [CGFloat] = [zero, one]
//
//            let myColorSpace = CGColorSpaceCreateDeviceRGB()
//            let myGradient = CGGradient(colorSpace: myColorSpace,
//                                        colorComponents: components, locations: locations, count: componentCount)
//
//            let myStartPoint = CGPoint(x: bounds.maxX, y: bounds.maxY)
//            let myEndPoint: CGPoint = CGPoint(x: bounds.minX, y: bounds.midY)
//
//            guard let gradient = myGradient else { return }
//
//
//            myContext.drawLinearGradient(gradient, start: myStartPoint, end: myEndPoint, options: .drawsAfterEndLocation)
//            myContext.restoreGState()
//        }
        
        // 2
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        context.clip(to: bounds)
        let colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        
        // 3
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 4
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        // 5
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)!
        
        // 6
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: bounds.height)
        context.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: .drawsAfterEndLocation)
        context.restoreGState()
    
        
    }
}
