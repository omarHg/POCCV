//
//  Extension+UIFont.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit

extension UIFont {
    static let fontSemibold = "Futura-Medium"
    static let fontBold = "Futura-Bold"
    
    static let semibold16 = UIFont(name: fontSemibold,
                                   size: 16) ?? UIFont.systemFont(ofSize: 16)
    static let semibold14 = UIFont(name: fontSemibold,
                                   size: 14) ?? UIFont.systemFont(ofSize: 14)
    static let semibold12 = UIFont(name: fontSemibold,
                                   size: 12) ?? UIFont.systemFont(ofSize: 12)
    
    static let bold32 = UIFont(name: fontBold,
                               size: 32) ?? UIFont.boldSystemFont(ofSize: 32.0)
    
    static let bold18 = UIFont(name: fontBold,
                               size: 18) ?? UIFont.boldSystemFont(ofSize: 18.0)

    static let bold16 = UIFont(name: fontBold,
                               size: 16) ?? UIFont.boldSystemFont(ofSize: 16.0)
    
    static let bold14 = UIFont(name: fontBold,
                               size: 14) ?? UIFont.boldSystemFont(ofSize: 14.0)
}
