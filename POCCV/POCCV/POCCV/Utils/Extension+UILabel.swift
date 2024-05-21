//
//  extension+UILabel.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit

extension UILabel {
    
    @IBInspectable var localizedText: String? {
        get {
            return nil
        }
        set(string) {
            self.text = string?.localizable
        }
    }
    
    @IBInspectable var custom: Bool {
        get {
            return false
        }
        
        set(value) {
            if value != true {
                return
            }
            font = .semibold14
            textColor = UIColor.label.primaryText
        }
    }
}
