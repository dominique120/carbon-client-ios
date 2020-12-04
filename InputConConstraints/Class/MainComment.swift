//
//  MainComment.swift
//  InputConConstraints
//
//  Created by user178961 on 11/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MainComment: UIViewController{
    
   
    @IBOutlet weak var commentTextBox: UITextField!
    
    @IBAction func sendComment(_ sender: Any) {
        
        
        
    }
    @IBOutlet weak var ConstraintCenterYContent: NSLayoutConstraint!
    @IBOutlet weak var ViewContent: UIView!
    
    @IBAction  func clickBtnBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    @IBAction func clickBtnCloseKeyboard(_ sender: Any) {
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        let finalPosYContent = self.ViewContent.frame.origin.y + self.ViewContent.frame.height
        let originKeyboardY = keyboardFrame.origin.y
        var delta: CGFloat = 0
        
        //let viewContentSpaceKeyboard: CGFloat = 10

        if originKeyboardY < finalPosYContent {
            delta = originKeyboardY - finalPosYContent
        }
        
        UIView.animate(withDuration: animationDuration) {
            self.ConstraintCenterYContent.constant = delta
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.ConstraintCenterYContent.constant = 0
            self.view.layoutIfNeeded()
            
        }
    }
}
