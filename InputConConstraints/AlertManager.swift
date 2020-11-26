//
//  AlertManager.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 19/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

extension UIViewController {
    
    typealias PressAlertAction = ()->Void
    
    func showAlert(title: String, message: String, acceptButton: String, pressAccept: PressAlertAction? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
        let acceptAction = UIAlertAction(title: acceptButton, style: .default) { (_) in
            pressAccept?()
        }
        
        alertController.addAction(acceptAction)
        
        self.present(alertController, animated: true, completion: nil)
        
//        self.perform(#selector(self.closeAlertSuck(alertController:)), with: alertController, afterDelay: 3)
    }
    
    func showAlert(title: String, message: String, acceptButton: String, cancelButton: String, pressAccept: PressAlertAction? = nil, pressCancel: PressAlertAction? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: acceptButton, style: .default) { (_) in
            pressAccept?()
        }
        
        let cancelAction = UIAlertAction(title: cancelButton, style: .cancel) { (_) in
            pressCancel?()
        }
          
        alertController.addAction(acceptAction)
        alertController.addAction(cancelAction)
          
        self.present(alertController, animated: true, completion: nil)
    }
    
//    @objc func closeAlertSuck(alertController: UIAlertController) {
//        alertController.dismiss(animated: true, completion: nil)
//    }
}
