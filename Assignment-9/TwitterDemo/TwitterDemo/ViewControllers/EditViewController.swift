//
//  EditViewController.swift
//  TwitterDemo
//
//  Created by macbook on 16.04.2021.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

protocol UserHelper: class {
    func setUser(_ user: CustomUser)
}

class EditViewController: UIViewController {

    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editSurname: UITextField!
    @IBOutlet weak var editBirthday: UIDatePicker!
    @IBOutlet weak var activeBar: UIActivityIndicatorView!
    
    static var delegate: UserHelper?
    
    private var ref = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var user: CustomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding gesture to the image
        editImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectedEditProfileImageView)))
        editImageView.isUserInteractionEnabled = true
        
        fillFields()
        
        decorate()
    }
    
    func fillFields() {
        editName.text = user?.wrappedName
        editSurname.text = user?.wrappedSurname
        
        editBirthday.date = user?.wrappedBirthday ?? Date()
        
        editImageView.image = UIImage(named:  "avatar")
        editImageView.loadImageUsingCache(user?.wrappedPictureURL ?? "default")
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        activeBar.startAnimating()
        
        user?.wrappedName = editName.text!
        user?.wrappedSurname = editSurname.text!
        user?.wrappedBirthday = editBirthday.date
        
        let storageRef = Storage.storage().reference().child(user!.wrappedPictureURL)
        
        if let uploadData = self.editImageView.image?.pngData() {
            storageRef.putData(uploadData, metadata: nil, completion: { [self]
                (metadata, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                self.ref.child("users").child(self.user!.wrappedId).updateChildValues(self.user!.data)
                
                activeBar.stopAnimating()
            })
        }
        
        EditViewController.delegate?.setUser(user!)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension EditViewController: Decoration, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func decorate() {
        makeCorner(textfield: editName, color: UIColor.white.cgColor)
        makeCorner(textfield: editSurname, color: UIColor.white.cgColor)
        
        editBirthday.setValue(UIColor.white, forKeyPath: "textColor")
        editBirthday.setValue(false, forKeyPath: "highlightsToday")
    }
    
    @objc func handleSelectedEditProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.modalPresentationStyle = .fullScreen
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            editImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
