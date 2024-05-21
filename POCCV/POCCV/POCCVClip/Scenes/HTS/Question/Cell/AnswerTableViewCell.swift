//
//  AnswerTableViewCell.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 10/05/24.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cellContainer: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellContainer.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        let selectedColor = UIColor(displayP3Red: 1.0/255.0*68.0,
                                    green: 1.0/255.0*78.0,
                                    blue: 1.0/233.0*230.0,
                                    alpha: 1.0)
        let selectedDescColor = UIColor(displayP3Red: 1.0/255.0*84.0,
                                    green: 1.0/255.0*86.0,
                                    blue: 1.0/233.0*90.0,
                                    alpha: 1.0)
        cellContainer.backgroundColor = selected ? selectedColor : .white
        titleLabel.textColor = selected ? .white : .black
        descriptionLabel.textColor = selected ? .white : selectedDescColor
    }
    
    func configure(model: ChoiceAnswer) {
        titleLabel.text = model.value
        descriptionLabel.text = model.description
    }
}
