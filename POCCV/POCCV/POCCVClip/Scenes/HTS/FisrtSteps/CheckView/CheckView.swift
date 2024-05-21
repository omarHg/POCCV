//
//  CheckView.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 10/05/24.
//

import UIKit

struct CheckViewModel {
    var title: String
    var desc: String
}

class CheckView: UIView {
    private var contentView: UIView!
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        contentView = loadViewFromNib(nibName: "CheckView", bundle: .main)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.pinEdges(to: self)
    }
    
    func configure(model: CheckViewModel) {
        titleLable.text = model.title
        descriptionLable.text = model.desc
    }
}
