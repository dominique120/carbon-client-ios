//
//  RecoverPasswordViewController.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 10/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//
import UIKit


class RecoverPaswordViewController: UIViewController {
    
    /* Recovery Outlets */
    @IBOutlet weak var mainBox: UIView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var userOrEmail: UITextField!


    /* Recovery Actions */
    @IBAction func editingHasEnded(_ sender: Any) {
         self.view.endEditing(true)
    }
    @IBAction func onClickSubmit(_ sender: Any) {
        let charset = CharacterSet(charactersIn: "@.")
        
        
        if userOrEmail.text?.rangeOfCharacter(from: charset) != nil {
            showMessage(controller: self, message: "An email has ben sent with a recovery link.", seconds: 5.0)
        } else {
                        showMessage(controller: self, message: "Please enter a valid email or user.", seconds: 5.0)
        }
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
    
       @objc func keyboardWillShow(_ notification: Notification) {
           let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
            view.frame.origin.y = -keyboardFrame.size.height + 180
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

