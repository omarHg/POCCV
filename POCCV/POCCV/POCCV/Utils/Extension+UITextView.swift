//
//  Extension+UITextView.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 01/03/24.
//

import UIKit

extension UITextView {
    @IBInspectable var custom: Bool {
        get {
            return false
        }
        
        set(value) {
            font = .semibold14
            textColor = UIColor.label.primaryText
            layer.cornerRadius = 4
            layer.borderWidth = 0.5
            layer.borderColor = UIColor.view.border.cgColor
        }
    }
}

extension UITextField {
    @IBInspectable var custom: Bool {
        get {
            return false
        }
        
        set(value) {
            font = .semibold14
            textColor = UIColor.label.primaryText
        }
    }
}

