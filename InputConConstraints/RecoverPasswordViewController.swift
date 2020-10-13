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
            view.frame.origin.y = -keyboardFrame.size.height + 120
       }
       
       @objc func keyboardWillHide(_ notification: Notification) {
            view.frame.origin.y = 0
       }

    }

