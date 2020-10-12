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
    
    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    
    
    /* SignUp Actions */
    @IBAction func closeKeyboardTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        txtFirstName.layer.cornerRadius = 15
        txtPassword.layer.cornerRadius = 15
        txtPasswordConfirm.layer.cornerRadius = 15
        txtLastName.layer.cornerRadius = 15
        txtUser.layer.cornerRadius = 15
        btnCreateAccount.layer.cornerRadius = 20
        mainBox.layer.cornerRadius = 20
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
           let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
               
           UIView.animate(withDuration: animationDuration){ self.constraintBottom.constant=keyboardFrame.size.height
               self.view.layoutIfNeeded()
    
           }
       }
    
    @objc func keyboardWillHide(_ notification: Notification) {
    
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            
        UIView.animate(withDuration: animationDuration){ self.constraintBottom.constant=0
            self.view.layoutIfNeeded()
        
        }

    }
    
}
