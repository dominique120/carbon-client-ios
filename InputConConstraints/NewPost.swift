//
//  MainNewPost.swift
//  InputConConstraints
//
//  Created by user178961 on 11/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class MainNewPost: UIViewController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    var imageForUpload: UIImage?
    var isImageSelected: Bool = false
    
    @IBOutlet weak var newPostBox: TVUIView!
    @IBOutlet weak var newPost: UIButton!
    
    @IBAction func sendNewPost(_ sender: Any) {
        
        if !g_imageSet {
            Util.showMessage(controller: self, message: "Seleccione una imagen", seconds: 2.0)
            
        } else {
            var imageId: String?
            imageId = UUID().uuidString
            ImageWS.sendIamge(imageId: imageId!, image: g_selectedImage!, {() in
                g_imageSet = false
            }, error: {(errorMessate) in
                print(errorMessate)
            })
            
            
            if (newPostBox.text!.isEmpty) {
                Util.showMessage(controller: self, message: "Ingrese un texto", seconds: 2.0)
            } else {
                PostWS.newPost({() in
                    Util.showMessage(controller: self, message: "Enviaste un mensaje!", seconds: 2.0)
                    self.newPostBox.text = ""
                }, img: "/" + imageId! + ".jpg", postBody: newPostBox.text!, personId: PersonBE.shared!.personId, posterName: PersonBE.shared!.displayName, error: {(errorMessage) in print(errorMessage)})
            }
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
        
        _ = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        _ = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
    }
}

extension MainNewPost: NewPostDelegate {
    func selectedImage(_ image: UIImage, _ isImageSelected: Bool) {
        self.imageForUpload = image
        self.isImageSelected = isImageSelected
    }
}


