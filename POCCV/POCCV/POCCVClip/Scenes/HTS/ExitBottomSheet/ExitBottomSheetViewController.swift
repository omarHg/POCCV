//  
//  ExitBottomSheetViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 10/05/24.
//

import UIKit

protocol ExitBottomSheetViewDelegate: AnyObject {
    func exit()
}

final class ExitBottomSheetViewController: UIViewController {
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var indicatorView: UIView!
    weak var delegate: ExitBottomSheetViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 20.0
        indicatorView.layer.cornerRadius = 2.0
    }
    
    @IBAction func tapBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func tapExit(_ sender: Any) {
        dismiss(animated: false) { [weak self] in
            self?.delegate?.exit()
        }
    }
}
