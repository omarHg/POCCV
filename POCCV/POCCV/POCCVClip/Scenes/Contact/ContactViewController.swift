//  
//  ContactViewController.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 09/02/24.
//

import UIKit

final class ContactViewController: BaseController {
    @IBOutlet weak private var scrollView: UIScrollView!

    @IBOutlet weak private var txtEmail: UITextField!
    @IBOutlet weak private var txtPhone: UITextField!
    @IBOutlet weak private var txtCel: UITextField!
    @IBOutlet weak private var txtAddress: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = String.Localized.contactTitle
        txtEmail.inputAccessoryView = addToolBar()
        txtPhone.inputAccessoryView = addToolBar()
        txtCel.inputAccessoryView = addToolBar()
        txtAddress.inputAccessoryView = addToolBar()
        getData()
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayOverlay()
    }
    
    func getData() {
        do {
            let contactData: ContactInformationEntity? = try? UserDefaults.standard.get()
            txtEmail.text = contactData?.email
            txtPhone.text = contactData?.phone
            txtCel.text = contactData?.cellphone
            txtAddress.text = contactData?.address
        }
    }
    
    func saveData() -> Bool {
        guard let email: String = txtEmail.text, !email.isEmpty,
              let cellphone: String = txtCel.text, !cellphone.isEmpty,
              let address = txtAddress.text, !address.isEmpty else {
            showAlertMessage(title: .Localized.emptyField,
                             message: .Localized.isRequired)
            return false
        }
        let phone: String? = txtPhone.text
        let entityData = ContactInformationEntity(email: email,
                                                  phone: phone,
                                                  cellphone: cellphone,
                                                  address: address)
        UserDefaults.standard.save(entity: entityData)
        return true
    }
    
    @IBAction func tapNext(_ sender: Any) {
        guard saveData() else {
            return
        }
        let controller = AcademicViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
