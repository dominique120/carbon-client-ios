//
//  MainProfile.swift
//  InputConConstraints
//
//  Created by user178961 on 11/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MainProfile: UIViewController, editProfileDelegate{
    
    func reloadProfile(){
        loadProfileData()
    }
    
    @IBOutlet weak var profImge: IMGUIview!
    @IBOutlet weak var profName: UILabel!
    @IBOutlet weak var profStudyField: UILabel!
    @IBOutlet weak var profDistrict: UILabel!
    @IBOutlet weak var profDOB: UILabel!
    @IBOutlet weak var profPostCount: UILabel!
    @IBOutlet weak var profFollowersCount: UILabel!
    @IBOutlet weak var profFollowingCount: UILabel!
        
    @IBAction func clickBtnCerrarrSesion(_ sender: Any){
        PersonBE.shared = nil
        UserBE.shared = nil
        ProfileBE.shared = nil
        g_activePersonId = "-1"
        g_activePostId = "-1"
        g_imageSet = false
        g_selectedImage = nil
        self.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadProfileData()
    }
    
    override func viewDidLoad() {
        self.loadProfileData()
        super.viewDidLoad()
    }
    
    func loadProfileData() {
        
        PersonWS.getPersonByUserId(UserBE.shared!.personId, success: { (objPerson) in
            PersonBE.shared = objPerson
                                 
            ProfileWS.getProfileByPersonId(PersonBE.shared!.profileId, success: { [self] (objProfile) in
                ProfileBE.shared = objProfile
                
                profDOB.text = ProfileBE.shared!.birthDate
                profName.text = PersonBE.shared!.firstName + " " + PersonBE.shared!.lastName
                profStudyField.text = ProfileBE.shared!.studyField
                profDistrict.text = ProfileBE.shared!.district
                profPostCount.text = ProfileBE.shared!.postCount
                profFollowingCount.text = ProfileBE.shared!.followingCount
                profFollowersCount.text = ProfileBE.shared!.followersCount
                
                self.profImge.downloadImageInUrlString(Constants.image_fs + PersonBE.shared!.profilePictureUrl) { (image, urlString) in
                    self.profImge.image = image
                }
                
                
            }) { (errorMessage) in
                print(errorMessage)
            }
            
        }) { (errorMessage) in
            print(errorMessage)
        }
        

    }
    
    @IBAction func btnEdit(_ sender: Any) {
        performSegue(withIdentifier: "openProfileEditor", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in prepare segue")
            let vc = segue.destination as! EditeProfile
            vc.delegate = self
        
    }
    
}
