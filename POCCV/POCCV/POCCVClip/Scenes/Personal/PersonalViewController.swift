//  
//  PersonalViewController.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit
import DatePicker

final class PersonalViewController: BaseController {
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var txtName: UITextField!
    @IBOutlet weak private var txtLastName: UITextField!
    @IBOutlet weak private var txtBirthDate: UITextField!
    @IBOutlet weak private var txtProfile: UITextView!
    private var birthDate: Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String.Localized.personalTitle
        txtBirthDate.delegate = self
        getData()
        txtName.inputAccessoryView = addToolBar()
        txtLastName.inputAccessoryView = addToolBar()
        txtProfile.inputAccessoryView = addToolBar()
        addobservers()
    }
    
    func addobservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let insetsBottom = scrollView.contentInset.bottom + 320.0
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: insetsBottom, right: 0.0)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0.0, right: 0.0)
    }
    
    func getData() {
        do {
            let personalData: PersonalInformationEntity? = try? UserDefaults.standard.get()
            txtName.text = personalData?.name
            txtLastName.text = personalData?.lastName
            txtBirthDate.text = personalData?.birthDateString
            txtProfile.text = personalData?.profile
            birthDate = personalData?.birthDate
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayOverlay()
    }
    
    func saveData() -> Bool {
        guard let name: String = txtName.text, !name.isEmpty,
        let lastName: String = txtLastName.text, !lastName.isEmpty,
        let birthDate = birthDate else {
            showAlertMessage(title: .Localized.emptyField,
                             message: .Localized.isRequired)
            return false
        }
        let profile: String = txtProfile.text
        let entityData = PersonalInformationEntity(name: name,
                                                   lastName: lastName,
                                                   birthDate: birthDate,
                                                   profile: profile)
        UserDefaults.standard.save(entity: entityData)
        return true
    }
    
    @IBAction func tapNext(_ sender: UIButton) {
        guard saveData() else {
            return
        }
        let controller = ContactViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showDatePicker(sender: UITextField) {
        guard let minDate = DatePickerHelper.shared.dateFrom(day: 01, month: 01, year: 1980),
              let maxDate = DatePickerHelper.shared.dateFrom(day: 01, month: 01, year: 2010) else {
            return
        }
        let today = Date()
        // Create picker object
        let datePicker = DatePicker()
        // Setup
        datePicker.setup(beginWith: today, min: minDate, max: maxDate) { [weak self] (selected, date) in
            if selected, let selectedDate = date {
                print(selectedDate.string())
                sender.text = selectedDate.string(format: Date.dayMontYear)
                self?.birthDate = selectedDate
            } else {
                print("Cancelled")
            }
        }
        // Display
        datePicker.show(in: self, on: sender)
    }
}

extension PersonalViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtBirthDate:
            showDatePicker(sender: txtBirthDate)
            return false
        default:
            return true
        }
    }
}
