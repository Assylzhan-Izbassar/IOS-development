//
//  SignUpViewController.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make some decore
        decorate()
        
        // adding gesture to the image
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectedProfileImageView)))
        profileImage.isUserInteractionEnabled = true
    }
    
    func showMessage(title t: String, message m: String) {
        let alert = UIAlertController(title: t, message: m, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            if t != "Error" {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func validate(password p: String) -> Bool {

        return true
    }
    
    func validate(email e: String) -> Bool {
        
        return true
    }
    
    /**
    Sign in the new user
     */
    @IBAction func signInUser(_ sender: UIButton) {
        let pictureName = "\(self.randomString(length: 7) ).png"
        let storageRef = Storage.storage().reference().child(pictureName)
        
        let key = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").childByAutoId().key
        
        let _name = name.text
        let _surname = surname.text
        let _birth = birthday.date

        
        if let e = email.text, let p = password.text {
            let user = CustomUser(key!, _name!, _surname!, e, _birth, pictureName)
            
            if validate(email: e) && validate(password: p) {
                Auth.auth().createUser(withEmail: e, password: p) { [weak self] (result, error) in
                    if error == nil {
                        
                        // successfully created user
                        
                        if let uploadData = self?.profileImage.image?.pngData() {
                            storageRef.putData(uploadData, metadata: nil, completion: {
                                (metadata, error) in
                                if error != nil {
                                    print(error!)
                                    return
                                }
                                
                                Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").child(key!).setValue(user.data)
                            })
                        }
                        
                        Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                        self?.showMessage(title: "Success", message: "Please, verify your email!")
                    } else {
                        self?.showMessage(title: "Error", message: "Something went wrong!")
                        print(error as Any)
                    }
                }
            }
        }
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

// MARK: - Extension

extension SignUpViewController: Decoration, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func decorate() {
        makeCorner(textfield: name, color: UIColor.white.cgColor)
        makeCorner(textfield: surname, color: UIColor.white.cgColor)
        makeCorner(textfield: email, color: UIColor.white.cgColor)
        makeCorner(textfield: password, color: UIColor.white.cgColor)
        makeCorner(button: signInBtn, color: UIColor.white.cgColor)
        
        birthday.setValue(UIColor.white, forKeyPath: "textColor")
        birthday.setValue(false, forKeyPath: "highlightsToday")
    }
    
    @objc func handleSelectedProfileImageView() {
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
            profileImage.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
