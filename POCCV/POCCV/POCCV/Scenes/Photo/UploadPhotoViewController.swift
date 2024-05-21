//
//  UploadPhotoViewController.swift
//  POCCV
//
//  Created by Omar Hernandez Gonzalez on 16/03/24.
//

import UIKit

final class UploadPhotoViewController: BaseController {
    @IBOutlet private weak var photoView: UIImageView!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { [weak self] in
            self?.getImage()
        })
    }
    
    func getImage() {
        DispatchQueue.main.async { [weak self] in
            if let image = UserDefaults.standard.getPhoto() {
                self?.photoView.image = image
            }
        }
    }
    
    @IBAction func btnUploadClicked() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func tapNext(_ sender: UIButton) {
        let controller = PersonalViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func saveImage(image: UIImage) {
        
    }
}

extension UploadPhotoViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // photoView.image = image
        UserDefaults.standard.save(image: image)
        getImage()
    }
}
