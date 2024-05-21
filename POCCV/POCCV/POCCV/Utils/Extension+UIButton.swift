//
//  Extension+UIButton.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit

/// UIButton extension to add variables and functions
extension UIButton {
    
    /// Variable as localizable, finds the localized string and sets it in the text property
    @IBInspectable var localizedText: String? {
        get {
            return nil
        }
        set(string) {
            self.setTitle(string?.localizable, for: .normal)
        }
    }
    
    @IBInspectable var custom: Bool {
        get {
            return false
        }
        
        set(value) {
            rounded = value
            tintColor = value ? UIColor.button.primaryTextButton : .black
            backgroundColor = value ? UIColor.button.primaryButton: .clear
            titleLabel?.font = .bold14
        }
    }
    
    @IBInspectable var rounded: Bool {
        get {
            return false
        }
        
        set(value) {
            if value {
                let valueHeight = frame.height
                layer.cornerRadius = value ? valueHeight/2 : 0.0
            }
        }
    }
    
    @IBInspectable var gbm: Bool {
        get {
            return false
        }
        
        set(value) {
            if value {
                rounded = true
                tintColor = value ? UIColor.black : .black
                backgroundColor = value ? UIColor.white: .clear
                titleLabel?.font = .semibold16
            }
        }
    }
    
    @IBInspectable var gbmBlack: Bool {
        get {
            return false
        }
        
        set(value) {
            if value {
                rounded = true
                tintColor = value ? UIColor.white : .black
                backgroundColor = value ? UIColor.black: .clear
                titleLabel?.font = .semibold16
            }
        }
    }
    
    @IBInspectable var gbmGray: Bool {
        get {
            return false
        }
        
        set(value) {
            if value {
                rounded = true
                let colorBG =  UIColor(displayP3Red: 1.0/255.0*20.0, 
                                       green: 1.0/255.0*20.0,
                                       blue: 1.0/255.0*20.0, alpha: 0.06)
                tintColor = value ? UIColor.black : .blue
                backgroundColor = value ? colorBG: .clear
                titleLabel?.font = .semibold16
            }
        }
    }
    
    @IBInspectable var gbmBlue: Bool {
        get {
            return false
        }
        
        set(value) {
            if value {
                rounded = true
                let colorBG =  UIColor(displayP3Red: 1.0/255.0*68.0,
                                       green: 1.0/255.0*78.0,
                                       blue: 1.0/255.0*230.0, alpha: 1.0)
                tintColor = value ? UIColor.white : .blue
                backgroundColor = value ? colorBG: .clear
                titleLabel?.font = .semibold16
            }
        }
    }
}
