//
//  ViewController.swift
//  InputConConstraints
//
//  Created by Kenyi Rodriguez on 10/1/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    //@IBOutlet weak var //constraintBottomScroll: //NSLayoutConstraint!
    @IBAction func clickCloseKeyboard(_ sender: Any) {
        print("CERRAR TECLADO ACCION")
        self.view.endEditing(true)
    }
    
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

