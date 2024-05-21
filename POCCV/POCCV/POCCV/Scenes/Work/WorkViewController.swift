//  
//  WorkViewController.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 01/03/24.
//

import UIKit
import DatePicker

final class WorkViewController: BaseController {
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var txtTitle: UITextField!
    @IBOutlet weak private var txtEmployer: UITextField!
    @IBOutlet weak private var txtDateStart: UITextField!
    @IBOutlet weak private var txtDateFinish: UITextField!
    @IBOutlet weak private var txtAddress: UITextField!
    @IBOutlet weak private var txtDescription: UITextView!
    @IBOutlet weak private var stackAcademics: UIStackView!
    var start: Date?
    var finish: Date?
    var employmentData: [EmploymentHistoryEntity] = []
    var inEdition: EmploymentHistoryEntity?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = String.Localized.workTitle
        addBarButtons()
        txtDateStart.delegate = self
        txtDateFinish.delegate = self
        txtTitle.delegate = self
        txtEmployer.delegate = self
        txtAddress.delegate = self
        txtDescription.delegate = self
        txtTitle.inputAccessoryView = addToolBar()
        txtEmployer.inputAccessoryView = addToolBar()
        txtAddress.inputAccessoryView = addToolBar()
        txtDescription.inputAccessoryView = addToolBar()
        getData()
        let insetsBottom = (view.safeAreaInsets.bottom) + 132.0
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: insetsBottom, right: 0.0)
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
        let insetsBottom = 320.0 + 132
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: insetsBottom, right: 0.0)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 132.0, right: 0.0)
    }
    
    func addBarButtons(edition: Bool = false) {
        let saveBtn = UIBarButtonItem(image: UIImage(systemName: "tray.and.arrow.down"), style: .plain, target: self, action: #selector(saveEmployement))
        var buttons: [UIBarButtonItem] = [saveBtn]
        if edition {
            let deleteBtn = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(deleteEmployement))
            buttons.append(deleteBtn)
        }
        navigationItem.rightBarButtonItems = buttons
    }
    
    @objc func deleteEmployement() {
        let alert = UIAlertController(title: .Localized.delete,
                                                     message: .Localized.deleteDesc,
                                                     preferredStyle: .alert)
        let okButton = UIAlertAction(title: .Localized.accept, style: .default) { [weak self] action in
            self?.deleteItem()
        }
        let cancelButton = UIAlertAction(title: .Localized.cancel, style: .default)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    }
    
    func deleteItem() {
        txtTitle.text = ""
        txtEmployer.text = ""
        txtAddress.text = ""
        txtDescription.text = ""
        txtDateStart.text = ""
        txtDateFinish.text = ""
        self.start = nil
        self.finish = nil
        if let inEdition = inEdition {
            employmentData.removeAll(where: {$0.id == inEdition.id})
            UserDefaults.standard.save(entity: employmentData)
            showEmployement()
        }
    }
    
    @objc func saveEmployement() {
        guard let title: String = txtTitle.text, !title.isEmpty,
              let start: Date = start,
              let finish: Date = finish,
              let employer: String = txtEmployer.text, !employer.isEmpty,
              let address = txtAddress.text, !address.isEmpty else {
            showAlertMessage(title: .Localized.emptyField,
                             message: .Localized.isRequired)
            return
        }
        let desc: String? = txtDescription.text
        txtTitle.text = ""
        txtEmployer.text = ""
        txtAddress.text = ""
        txtDescription.text = ""
        txtDateStart.text = ""
        txtDateFinish.text = ""
        self.start = nil
        self.finish = nil
        if var inEdition = inEdition {
            inEdition.title = title
            inEdition.employer = employer
            inEdition.start = start
            inEdition.finish = finish
            inEdition.city = address
            inEdition.description = desc
            employmentData.removeAll(where: {$0.id == inEdition.id})
            employmentData.append(inEdition)
        } else {
            let new = EmploymentHistoryEntity(id: employmentData.count,
                                              title: title,
                                              employer: employer,
                                              start: start,
                                              finish: finish,
                                              city: address,
                                              description: desc)
            employmentData.append(new)
        }
        UserDefaults.standard.save(entity: employmentData)
        showEmployement()
    }
    
    func showEmployement() {
        stackAcademics.removeFullyAllArrangedSubviews()
        for employment in employmentData {
            let viewAc = WorkView()// AcademicView()
            viewAc.setText(data: employment)
            viewAc.didTap = { [weak self] id in
                self?.editItem(id: id)
            }
            stackAcademics.addArrangedSubview(viewAc)
        }
    }
    
    func editItem(id: Int) {
        do {
            inEdition = employmentData.first(where: {$0.id == id})
            txtTitle.text = inEdition?.title
            txtEmployer.text = inEdition?.employer
            txtAddress.text = inEdition?.city
            txtDescription.text = inEdition?.description
            txtDateStart.text = inEdition?.start.defaultString()
            txtDateFinish.text = inEdition?.finish.defaultString()
            start = inEdition?.start
            finish = inEdition?.finish
            addBarButtons(edition: true)
        }
    }
    
    func getData() {
        do {
            employmentData = (try? UserDefaults.standard.get()) ?? []
            showEmployement()
        }
    }
    
    @IBAction func tapSave(_ sender: Any) {
        saveEmployement()
    }
    
    @IBAction func tapNext(_ sender: Any) {
        let controller = CompetenciesViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showDatePicker(sender: UITextField) {
        guard let minDate = DatePickerHelper.shared.dateFrom(day: 01, month: 01, year: 1980),
              let maxDate = DatePickerHelper.shared.dateFrom(day: 01, month: 01, year: 2030) else {
            return
        }
        let today = Date()
        // Create picker object
        let datePicker = DatePicker()
        // Setup
        datePicker.setup(beginWith: today, min: minDate, max: maxDate) { [weak self] (selected, date) in
            if selected, let selectedDate = date {
                print(selectedDate.string())
                sender.text = selectedDate.defaultString()
                switch sender {
                case self?.txtDateStart:
                    self?.start = selectedDate
                case self?.txtDateFinish:
                    self?.finish = selectedDate
                default:
                    break
                }
            } else {
                print("Cancelled")
            }
        }
        // Display
        datePicker.show(in: self, on: sender)
    }
}

extension WorkViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtDateStart:
            view.endEditing(true)
            showDatePicker(sender: txtDateStart)
            return false
        case txtDateFinish:
            view.endEditing(true)
            showDatePicker(sender: txtDateFinish)
            return false
        default:
            return true
        }
    }
}
