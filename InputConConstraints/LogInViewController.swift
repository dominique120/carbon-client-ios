//
//  LogInViewController.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 10/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    /* LogIn Actions */
    @IBAction func clickCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    /* LogIn Outlets */
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtPssword: UITextField!
    @IBOutlet weak var mainBox: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        if txtFirstName.text == "Username" && txtPssword.text == "Password"{
        showMessage(controller: self, message: "Usuario y clave validada, bienvenid@!", seconds: 5.0)
        } else if txtFirstName.text == "Username" && txtPssword.text != "Password"{
            showMessage(controller: self, message: "Clave incorrecta, intente nuevamente.", seconds: 5.0)
        } else {
                        showMessage(controller: self, message: "Ese usuario no existe.", seconds: 5.0)
        }
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
       
       override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
           NotificationCenter.default.removeObserver(self)
       }
       
       @objc func keyboardWillShow(_ notification: Notification) {
           let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        	view.frame.origin.y = -keyboardFrame.size.height + 220
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


