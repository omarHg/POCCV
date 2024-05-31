//
//  MainViewController.swift
//  POCCVClip
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit
class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        view.backgroundColor = UIColor.view.background
        overrideUserInterfaceStyle = .light
    }
    
    func addToolBar() -> UIToolbar {
        let toolBar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 44.0)))

        toolBar.barStyle = .default
        toolBar.items = [
        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
        UIBarButtonItem(title: .Localized.accept, style: .plain, target: self, action: #selector(doneSelector))]
        toolBar.sizeToFit()
        return toolBar
    }
    
    @objc func doneSelector() {
        view.endEditing(true)
    }
    
    func displayOverlay() {
    }
    
    func removeBack() {
        navigationItem.setHidesBackButton(true, animated: true)
    }
}

final class MainViewController: BaseController {
    @IBOutlet weak private var presentationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationLbl.font = .bold32
        presentationLbl.textColor = UIColor.label.primaryText
    }
    
    @IBAction func tapStart(_ sender: UIButton) {
        let controller = UploadPhotoViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func tapStartHTS(_ sender: UIButton) {
        guard let answers: [ChoiceAnswer] = try? UserDefaults.standard.get() else {
            return
        }
        
        let view = FirstStepsViewController()
        UserDefaults.standard.save(entity: answers)
        view.firstStepViewModel = FirstStepViewModel(answers: answers)
        navigationController?.pushViewController(view, animated: true)
    }
}

