//
//  Extension+UIViewController.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 23/03/24.
//

import UIKit

extension UIViewController {
    func showAlertMessage(title: String,
                          message: String){
        let alertMessagePopUpBox = UIAlertController(title: title, 
                                                     message: message,
                                                     preferredStyle: .alert)
        let okButton = UIAlertAction(title: .Localized.accept,
                                     style: .default)
        alertMessagePopUpBox.addAction(okButton)
        present(alertMessagePopUpBox, animated: true)
    }
}
