//
//  SignUpViewController.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 10/11/20.
//  Copyright © 2020 Dominique Verellen. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    /* SignUp Outlets */
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var txtPasswordConfirm: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var mainBox: UIView!
    
    /* SignUp Actions */
    @IBAction func editingHasEnded(_ sender: Any) {
         self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        btnCreateAccount.layer.cornerRadius = 20
        mainBox.layer.cornerRadius = 20
        
        self.updateBorderSelect(false, toTextField: self.txtFirstName)
        self.updateBorderSelect(false, toTextField: self.txtPassword)
        self.updateBorderSelect(false, toTextField: self.txtUser)
        self.updateBorderSelect(false, toTextField: self.txtPasswordConfirm)
        self.updateBorderSelect(false, toTextField: self.txtLastName)
        super.viewDidLoad()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
    
       @objc func keyboardWillShow(_ notification: Notification) {
           let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
            view.frame.origin.y = -keyboardFrame.size.height + 120
       }
       
       @objc func keyboardWillHide(_ notification: Notification) {
            view.frame.origin.y = 0
       }
    
    func updateBorderSelect(_ isSelect: Bool, toTextField textField: UITextField) {
        
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = isSelect ? UIColor(displayP3Red: 0.1, green: 0.1, blue: 1, alpha: 0.7).cgColor : UIColor.lightGray.cgColor
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.layer.shadowRadius = 5
        textField.layer.shadowOpacity = 0.1
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.updateBorderSelect(true, toTextField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.updateBorderSelect(false, toTextField: textField)
    }
}
