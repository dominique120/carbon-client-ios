//
//  ViewController.swift
//  InputConConstraints
//
//  Created by Kenyi Rodriguez on 10/1/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var constraintCenterYContent: NSLayoutConstraint!
    @IBOutlet weak var viewContent: UIView!
    
    
    @IBAction func clickCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
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
        
        let finalPosyContent = self.viewContent.frame.origin.y + self.viewContent.frame.height
        let originKeyboardY = keyboardFrame.origin.y
        var delta: CGFloat = 0
        let spaceKeyboarToViewContent: CGFloat = 20
        
        if originKeyboardY < finalPosyContent {
            delta = originKeyboardY - finalPosyContent - spaceKeyboarToViewContent
        }
        
        UIView.animate(withDuration: animationDuration) {
            
            self.constraintCenterYContent.constant = delta
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            
            self.constraintCenterYContent.constant = 0
            self.view.layoutIfNeeded()
        }
    }

}

