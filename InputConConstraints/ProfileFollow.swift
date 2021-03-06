//
//  ProfileFollow.swift
//  InputConConstraints
//
//  Created by user178961 on 12/7/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ProfileFollow: UIViewController{
    
    @IBAction func swipeRecognizer(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var profileImg: IMGUIview!
    @IBOutlet weak var followBtn: BTUView!
    @IBOutlet weak var studyField: UILabel!
    @IBOutlet weak var district: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var personName: UILabel!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    @IBAction  func clickBtnBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    var thisPerson: PersonBE?
    var thisProfile: ProfileBE?
    
    @IBAction func followPerson(_ sender: Any) {
        if PersonBE.shared?.personId == thisPerson!.personId {
            Util.showMessage(controller: self , message: "No te puedes seguir a ti mismo!", seconds: 1.5)
        } else {
            FollowerWS.followSomeone(followerId: g_activePersonId, followingId: thisPerson!.personId, success: { () in
                
                var fc = Int(self.followerCount.text!)
                fc! += 1
                self.followerCount.text = String(fc!)
                self.followBtn.setTitle("Following!", for: .disabled)
                
                Util.showMessage(controller: self , message: "Followed!", seconds: 1.5)
                
            }) { (errorMessage) in
                print(errorMessage)
            }
        }
    }
    @IBOutlet weak var loaderAnim: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        loaderAnim.startAnimating()
        PersonWS.getPersonByPersonId(g_activePersonId, success: { (objPerson) in
            self.thisPerson = objPerson
            self.personName.text = objPerson.firstName + " " + objPerson.lastName
            self.profileImg.downloadImageInUrlString(Constants.image_fs + objPerson.profilePictureUrl) { (image, urlString) in
                self.profileImg.image = image
                self.loaderAnim.stopAnimating()
            }
        }) { (errorMessage) in
            print(errorMessage)
        }
        
        ProfileWS.getProfileByPersonId(g_activePersonId, success: { (objProfile) in
            self.thisProfile = objProfile
            self.studyField.text! = objProfile.studyField
            self.district.text! = objProfile.district
            self.DOB.text! = objProfile.birthDate
            self.postCount.text! = objProfile.postCount
            self.followingCount.text! = objProfile.followingCount
            self.followerCount.text! = objProfile.followersCount
            
        }) { (errorMessage) in
            print(errorMessage)
        }
        super.viewWillAppear(animated)
    }
    
}
