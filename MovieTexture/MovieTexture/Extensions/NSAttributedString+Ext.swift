//
//  NSAttributedString+Ext.swift
//  MovieTexture
//
//  Created by Dmitriy Safarov on 30/07/2019.
//  Copyright © 2019 SimpleCode. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    static func forTitleText(_ text: String) -> NSAttributedString {
        let attributedString = NSAttributedString(string: text,
                                                  attributes: [
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white
            ])
        return attributedString
    }
    
    static func forDescriptionText(_ text: String) -> NSAttributedString {
        let attributedString = NSAttributedString(string: text,
                                                  attributes: [
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white
            ])
        return attributedString
    }
    
}
