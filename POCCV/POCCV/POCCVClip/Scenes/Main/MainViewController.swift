//
//  MainViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit
import StoreKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        view.backgroundColor = UIColor.view.background
        overrideUserInterfaceStyle = .light
    }
    
    func removeBack() {
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func addToolBar() -> UIToolbar {
        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        numberToolbar.barStyle = .default
        numberToolbar.items = [
        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
        UIBarButtonItem(title: .Localized.accept, style: .plain, target: self, action: #selector(doneSelector))]
        numberToolbar.sizeToFit()
        return numberToolbar
    }
    
    @objc func doneSelector() {
        view.endEditing(true)
    }
    
    func displayOverlay() {
        guard let scene = view.window?.windowScene else { return }
        let config = SKOverlay.AppClipConfiguration(position: .bottom)
        let overlay = SKOverlay(configuration: config)
        overlay.present(in: scene)
    }
}

final class MainViewController: BaseController {
    @IBOutlet weak private var presentationLbl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationLbl.font = .bold32
        presentationLbl.textColor = UIColor.label.primaryText
    }
    
    @IBAction func tapStart(_ sender: UIButton) {
        let controller = PersonalViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func tapStartHTS(_ sender: UIButton) {
        guard let answers: [ChoiceAnswer] = try? UserDefaults.standard.get() else {
            let controller = StartHTSViewController()
            navigationController?.pushViewController(controller, animated: true)
            return
        }
        
        let view = FirstStepsViewController()
        UserDefaults.standard.save(entity: answers)
        view.firstStepViewModel = FirstStepViewModel(answers: answers)
        navigationController?.pushViewController(view, animated: true)
    }
}

