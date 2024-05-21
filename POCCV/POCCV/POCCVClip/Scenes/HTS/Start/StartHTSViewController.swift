//
//  StartHTSViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 03/05/24.
//

import UIKit

class StartHTSViewController: BaseController {
    
    @IBOutlet weak var gradientContent: UIView!
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 0.6, 0.8, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = UIScreen.main.bounds
        gradientContent.layer.insertSublayer(gradientLayer, at: 0)
        removeBack()
        configureNavigacion()
    }
    
    func configureNavigacion() {
        let exportoBtn = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(close))
        exportoBtn.tintColor = .white
        navigationItem.rightBarButtonItems = [exportoBtn]
    }
    
    @objc func close() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func TapNext(_ sender: UIButton) {
        let view = GettingKnowYouViewController()
        
        navigationController?.pushViewController(view, animated: true)
    }
}
