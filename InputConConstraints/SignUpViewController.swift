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
    @IBOutlet weak var txtDisplayName: TFUIView!
    @IBOutlet weak var txtEmail: TFUIView!
    
    /* SignUp Actions */
    @IBAction func editingHasEnded(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func onClickCreateAccount(_ sender: Any) {
        
        if txtUser.text!.isEmpty {
            Util.showMessage(controller: self, message: "Ingrese un usuario.", seconds: 3.0)
        } else if txtPassword.text!.isEmpty {
            Util.showMessage(controller: self, message: "Ingrese una clave.", seconds: 3.0)
        } else if txtDisplayName.text!.isEmpty {
            Util.showMessage(controller: self, message: "Ingrese un displayname.", seconds: 3.0)
        } else if txtEmail.text!.isEmpty {
            Util.showMessage(controller: self, message: "Ingrese un correo", seconds: 3.0)
        } else if txtFirstName.text!.isEmpty {
            Util.showMessage(controller: self, message: "Ingrese un nombre", seconds: 3.0)
        } else if txtLastName.text!.isEmpty {
            Util.showMessage(controller: self, message: "Ingerse un apellido", seconds: 3.0)
        } else {
            AccountWS.createAccount({() in
                Util.showMessage(controller: self, message: "Se creo tu cuenta! No olvides editar tu perfil.", seconds: 3.0)
            }, {(errorMessage) in
                print(errorMessage)
            }, username: txtUser.text!, password: txtPassword.text!, displayName: txtPasswordConfirm.text!, email: txtEmail.text!, firstName: txtFirstName.text!, lastName: txtLastName.text!)
        }
    }
    
    @IBAction func swipeRecognizer(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
          
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        view.frame.origin.y = -keyboardFrame.size.height + 190
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func showMessage(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
}
