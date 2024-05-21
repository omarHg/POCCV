//
//  CVSectionView.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 14/03/24.
//

import UIKit

let lineHeightMultipleTitle: CGFloat = 1.0

struct ItemSection {
    var title: String?
    var date: String?
    var desc: String?
    
    func attributes() -> NSAttributedString {
        let attributes = NSMutableAttributedString()

        if let title = title {
            let attributes1 = NSAttributedString(string: String(format: "%@", title), attributes: [
                .font: UIFont.semibold16,
                .foregroundColor: UIColor.label.primaryText]).setLineSpacing(lineHeightMultiple: lineHeightMultipleTitle)
            attributes.append(attributes1)
        }
        
        if let date = date {
            let aditional = title == nil ? "" : "\n"
            let attributes2 = NSAttributedString(string: String(format: "%@%@", aditional, date), attributes: [
                .font: UIFont.semibold12,
                .foregroundColor: UIColor.label.secondaryText]).setLineSpacing()
            attributes.append(attributes2)
        }
        
        if let desc = desc, desc != "" {
            var aditional = ""
            if date == nil {
                if title != nil {
                    aditional = "\n"
                }
            } else {
                aditional = "\n"
            }
            let attributes3 = NSAttributedString(string: String(format: "%@%@", aditional, desc), attributes: [
                .font: UIFont.semibold14,
                .foregroundColor: UIColor.label.primaryText]).setLineSpacing()
            
            attributes.append(attributes3)
        }
        
        return attributes
    }
    
    func createLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = attributes()
        return label
    }
}

class CVSectionView: UIView {
    private var contentView: UIView!
    @IBOutlet private weak var titleSection: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var stackContent: UIStackView!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.cornerRadius = bounds.height/2
        //clipsToBounds = true
    }
    
    private func loadView() {
        contentView = loadViewFromNib(nibName: "CVSectionView", bundle: .main)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.pinEdges(to: self)
    }
    
    func configureTitle(name: String, image: UIImage?, items: [ItemSection]) {
        let attributes1 = NSAttributedString(string: String(format: "%@", name), attributes: [
            .font: UIFont.bold18,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing(lineHeightMultiple: lineHeightMultipleTitle)
        let attributes = NSMutableAttributedString()
        attributes.append(attributes1)
        titleSection.attributedText = attributes
        imageView.image = image
        for item in items {
            stackContent.addArrangedSubview(item.createLabel())
        }
    }
}
