//
//  MainNewPost.swift
//  InputConConstraints
//
//  Created by user178961 on 11/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class MainNewPost: UIViewController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    @IBOutlet weak var newPostBox: TVUIView!
    @IBOutlet weak var newPost: UIButton!
    
    @IBAction func sendNewPost(_ sender: Any) {
        if (newPostBox.text!.isEmpty) {
            Util.showMessage(controller: self, message: "Ingrese un texto", seconds: 5)
        } else {
            PostWS.newPost({() in
                Util.showMessage(controller: self, message: "Enviaste un mensaje!", seconds: 3.0)
                // pop view controller
            }, img: "/img.jpg", postBody: newPostBox.text!, personId: PersonBE.shared!.personId, posterName: PersonBE.shared!.displayName, error: {(errorMessage) in print(errorMessage)})
        }
    }
    
    @IBAction func TapCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
    }
}

