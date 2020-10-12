//
//  RecoverPasswordViewController.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 10/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit


class RecoverPaswordViewController: UIViewController {
    
    
    @IBOutlet weak var mainBox: UIView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var userOrEmail: UITextField!


    @IBAction func endEditing(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        mainBox.layer.cornerRadius = 20
        userOrEmail.layer.cornerRadius = 15
        btnSend.frame = CGRect(x: 0, y: 0 , width: 50, height: 50)
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
