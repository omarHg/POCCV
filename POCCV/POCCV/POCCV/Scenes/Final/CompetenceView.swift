//
//  CompetenceView.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 16/03/24.
//

import UIKit

class CompetenceView: UIView {
    private var contentView: UIView!
    @IBOutlet weak var competenceLbl: UILabel!
    @IBOutlet weak var progressview: UIProgressView!

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
        contentView = loadViewFromNib(nibName: "CompetenceView", bundle: .main)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.pinEdges(to: self)
    }
    
    func configure(entity: CompetenceEntity) {
        competenceLbl.text = entity.title
        progressview.progress = 1.0/10.0*Float(entity.value)
    }
}
