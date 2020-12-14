//
//  SelectImageViewController.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/5/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol NewPostDelegate {
    func selectedImage(_ image: UIImage, _ isImageSelected: Bool)
}

class imageSelectViewController: UIViewController {
    
    var postDelegate: NewPostDelegate?
    
    
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker: ImagePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    @IBAction func clickBtnBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectImage(_ sender: Any) {
        g_selectedImage = imageView.image!
        g_imageSet = true
        self.postDelegate?.selectedImage(imageView.image!, true)
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension imageSelectViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        g_selectedImage = imageView.image!
        self.imageView.image = image
        g_imageSet = true
        self.postDelegate?.selectedImage(image!, true)
    }
    
}
