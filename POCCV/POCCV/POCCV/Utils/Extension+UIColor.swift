//
//  Extension+UIColor.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit
extension UIColor {
    
    static func fromAsset(_ name: String) -> UIColor {
        return UIColor(named: name) ?? .black
    }
    
    struct button {
        static var primaryButton: UIColor { return UIColor.fromAsset(#function) }
        static var primaryTextButton: UIColor { return UIColor.fromAsset(#function) }
    }
    
    struct view {
        static var background: UIColor { return UIColor.fromAsset(#function) }
        static var border: UIColor { return UIColor.fromAsset(#function) }
    }
    
    struct label {
        static var primaryText: UIColor { return UIColor.fromAsset(#function) }
        static var secondaryText: UIColor { return UIColor.fromAsset(#function) }        
    }
}
