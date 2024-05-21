//
//  CVPersonal.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 14/03/24.
//

import UIKit

class CVPersonalNameView: UIView {

    private var contentView: UIView!
    @IBOutlet private weak var titleName: UILabel!
    @IBOutlet private weak var imageView: UIImageView!

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
        contentView = loadViewFromNib(nibName: "CVPersonalNameView", bundle: .main)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.pinEdges(to: self)
    }
    
    func configureTitle(name: String, title: String) {
        let attributes = NSMutableAttributedString()

        let attributes1 = NSAttributedString(string: String(format: "%@", name), attributes: [
            .font: UIFont.bold32,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing(lineHeightMultiple: lineHeightMultipleTitle)
        attributes.append(attributes1)

        if title != "" {
            let attributes2 = NSAttributedString(string: String(format: "\n%@", title), attributes: [
                .font: UIFont.semibold14,
                .foregroundColor: UIColor.label.secondaryText]).setLineSpacing()
            attributes.append(attributes2)
        }
        titleName.attributedText = attributes
    }
    
    func configurePhoto(image: UIImage?) {
        imageView.isHidden = image == nil ? true : false
        DispatchQueue.main.async { [weak self] in
            self?.imageView.image = image
        }
    }
}
