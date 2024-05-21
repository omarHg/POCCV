//  
//  GettingKnowYouViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 10/05/24.
//

import UIKit

final class GettingKnowYouViewController: BaseController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        removeBack()
        configureNavigacion()
    }
    
    func configureNavigacion() {
        let exportoBtn = UIBarButtonItem(image: UIImage(named: "closeButton"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(close))
        navigationItem.rightBarButtonItems = [exportoBtn]
    }
    
    @objc func close() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func tapNext(_ sender: UIButton) {
        let questionary: GetQuestionary.Response = .init()
        
        let view = QuestionViewControllerViewController()
        view.question = questionary.questions.first(where: {$0.questionID == "188fb872-00a0-4d02-9975-b7d82519c5aa"})
        view.multiplier = 1.0
        navigationController?.pushViewController(view, animated: true)
    }
}
