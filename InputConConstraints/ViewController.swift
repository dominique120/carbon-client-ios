//
//  ViewController.swift
//  InputConConstraints
//
//  Created by Kenyi Rodriguez on 10/1/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainBox: UIView!
    
    @IBOutlet weak var passwordTxtBox: UITextField!
    @IBOutlet weak var usernameTxtBox: UITextField!
    
    @IBOutlet weak var submitBtnButton: UIButton!
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    //@IBOutlet weak var //constraintBottomScroll: //NSLayoutConstraint!
    @IBAction func clickCloseKeyboard(_ sender: Any) {
               self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        mainBox.layer.cornerRadius = 20
        passwordTxtBox.layer.cornerRadius = 10
        usernameTxtBox.layer.cornerRadius = 10
        submitBtnButton.layer.cornerRadius = 20
        super.viewDidLoad()
       
	
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
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        	
        UIView.animate(withDuration: animationDuration){ self.constraintBottomScroll.constant=keyboardFrame.size.height
            self.view.layoutIfNeeded()
 
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
    
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            
        UIView.animate(withDuration: animationDuration){ self.constraintBottomScroll.constant=0
            self.view.layoutIfNeeded()
        
        }

    }

}

