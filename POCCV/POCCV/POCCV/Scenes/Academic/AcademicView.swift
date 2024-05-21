//
//  AcademicView.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 01/03/24.
//

import UIKit

class AcademicView: UIView {
    private var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    var didTap: ((Int) -> Void)?
    var data: AcademicInformationEntity?
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
        contentView = loadViewFromNib(nibName: "AcademicView", bundle: .main)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.pinEdges(to: self)
    }
    
    func setText(data: AcademicInformationEntity) {
        self.data = data
        let attributes1 = NSAttributedString(string: data.fullTitle() + "\n", attributes: [
            .font: UIFont.bold14,
            .foregroundColor: UIColor.label.primaryText]).setLineSpacing()
        
        let attributes2 = NSAttributedString(string: data.fullDate(), attributes: [
            .font: UIFont.semibold14,
            .foregroundColor: UIColor.label.secondaryText]).setLineSpacing()
        
        let attributes = NSMutableAttributedString()
        attributes.append(attributes1)
        attributes.append(attributes2)
        if let desc = data.description, desc != "" {
            let description = "\n" + desc
            let attributes3 = NSAttributedString(string: description, attributes: [
                .font: UIFont.semibold14,
                .foregroundColor: UIColor.label.primaryText]).setLineSpacing()
            attributes.append(attributes3)
        }
        titleLabel.attributedText = attributes
    }
    
    @IBAction func tapNext(_ sender: Any) {
        guard let data = data, isfull else {
            return
        }
        didTap?(data.id)
    }
}
