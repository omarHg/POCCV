//  
//  InviteViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 16/03/24.
//

import UIKit

final class InviteView: UIView {
    private var contentView: UIView!
    @IBOutlet private weak var titleSection: UILabel!
    @IBOutlet private weak var floatView: UIView!

    var tapDownload: (() -> Void)?
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
        floatView.layer.cornerRadius = 24
        floatView.clipsToBounds = true
    }
    
    private func loadView() {
        contentView = loadViewFromNib(nibName: "InviteView", bundle: .main)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.pinEdges(to: self)
        configure()
    }
    
    func configure() {
        
        let attributes = NSMutableAttributedString()
        
        let title: String = .Localized.inviteDesc
        let attributes1 = NSAttributedString(string: String(format: "%@", title), attributes: [
            .font: UIFont.bold18,
            .foregroundColor: UIColor.label.primaryText])
        attributes.append(attributes1)
        
        let attributes2 = NSAttributedString(string: String(format: "%@", String.Localized.inviteDesc1), attributes: [
            .font: UIFont.semibold16,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing(lineHeightMultiple: lineHeightMultipleTitle,
                                                                         alignment: .center)
        attributes.append(attributes2)
        
        titleSection.attributedText = attributes
        titleSection.textAlignment = .center
    }
    
    @IBAction func tapDownload(_ sender: Any) {
        tapDownload?()
    }
    
    @IBAction func tapClose(_ sender: Any) {
        isHidden = true
    }
}
