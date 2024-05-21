//
//  Extension+UIView.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 01/03/24.
//

import UIKit

extension UIView {
    func loadViewFromNib(nibName: String, bundle: Bundle?) -> UIView {
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Cannot found a Nib with identifier \(nibName)")
        }
        return view
    }
    
    func pinEdges(to other: UIView, insets: UIEdgeInsets = .zero) {
        leadingAnchor.constraint(equalTo: other.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: other.trailingAnchor, constant: -insets.right).isActive = true
        topAnchor.constraint(equalTo: other.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: -insets.bottom).isActive = true
    }
}

extension UIView {

    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
    
}
