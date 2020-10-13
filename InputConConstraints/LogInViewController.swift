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
        	view.frame.origin.y = -keyboardFrame.size.height + 120
       }
       
       @objc func keyboardWillHide(_ notification: Notification) {
            view.frame.origin.y = 0
       }
    
}
