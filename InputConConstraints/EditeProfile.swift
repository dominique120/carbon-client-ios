//
//  EditeProfile.swift
//  InputConConstraints
//
//  Created by user178961 on 12/8/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class EditeProfile : UIViewController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    @IBOutlet weak var studyField: UITextField!
    @IBOutlet weak var district: UITextField!
    @IBOutlet weak var DOB: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var profileImage: IMGUIview!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var displayName: UITextField!
    @IBOutlet weak var aboutMe: UITextField!
    
    @IBOutlet weak var ScrollHeight: NSLayoutConstraint!
    @IBOutlet weak var ConstraintCenter: NSLayoutConstraint!

    
    @IBAction  func clickBtnBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmChanges(_ sender: Any) {
        ProfileWS.editProfile(profileId: ProfileBE.shared!.profileId, studyField: studyField.text!, district: district.text!, birthDate: DOB.text!, profileSummary: aboutMe.text!, {()}, error: {(errorMessage) in print(errorMessage)})
        
        PersonWS.editPerson(personId: PersonBE.shared!.personId, firstName: name.text!, lastName: lastName.text!, displayName: displayName.text!, {()}, error: {(errorMessage) in print(errorMessage)})
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
        studyField.text = ProfileBE.shared?.studyField
        district.text = ProfileBE.shared?.district
        DOB.text = ProfileBE.shared?.birthDate
        name.text = PersonBE.shared!.firstName
        lastName.text = PersonBE.shared!.lastName
        displayName.text = PersonBE.shared!.displayName
        aboutMe.text = ProfileBE.shared!.profileSummary
        
        
        profileImage.downloadImageInUrlString(Constants.image_fs + PersonBE.shared!.profilePictureUrl) { (image, urlString) in
            self.profileImage.image = image
        }
        
        super.viewWillAppear(animated)
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
        
        UIView.animate(withDuration: animationDuration) {
            
            self.ConstraintCenter.constant = -keyboardFrame.height
            self.ScrollHeight.constant=self.ScrollHeight.constant+400
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            
            self.ConstraintCenter.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

    
    

