//  
//  FirstStepsViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 10/05/24.
//

import UIKit
import StoreKit

final class FirstStepsViewController: BaseController {
    var firstStepViewModel: FirstStepViewModel?
    
    @IBOutlet private weak var principalStack: UIStackView!
    @IBOutlet private weak var blackView: UIView!
    @IBOutlet private weak var blackTitleLabel: UILabel!
    @IBOutlet private weak var blackDescriptionLabel: UILabel!
    @IBOutlet private weak var checkStack: UIStackView!
    @IBOutlet private weak var blueButton: UIButton!
    
    @IBOutlet private weak var whiteView: UIView!
    @IBOutlet private weak var smartSavingsLabel: UILabel!
    @IBOutlet private weak var smartSavingsDescLabel: UILabel!
    @IBOutlet private weak var grayButton: UIButton!
    @IBOutlet private weak var anualRate: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        blackTitleLabel.text = firstStepViewModel?.title
        blackDescriptionLabel.text = firstStepViewModel?.desc
        smartSavingsLabel.text = firstStepViewModel?.smartSavingtitle
        smartSavingsDescLabel.text = firstStepViewModel?.smartSavingDesc
        anualRate.text = firstStepViewModel?.anualRate
        anualRate.isHidden = firstStepViewModel?.anualRate == ""
        blackView.layer.cornerRadius = 20
        whiteView.layer.cornerRadius = 20
        removeBack()
        configureStack()
        configureButtons()
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureStack() {
        principalStack.setCustomSpacing(0.0, 
                                        after: smartSavingsLabel)
        guard let model = firstStepViewModel else {
            return
        }
        for view in model.checksViews {
            checkStack.addArrangedSubview(view)
        }
    }
    
    func configureButtons() {
        guard let model = firstStepViewModel else {
            return
        }
        blueButton.setTitle(model.blueButtonTitle, for: .normal)
        grayButton.setTitle(model.grayButtonTitle, for: .normal)
    }
    
    @IBAction func TapBlueButton(_ sender: UIButton) {
        displayOverlay()
    }
}
