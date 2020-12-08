//
//  MainProfile.swift
//  InputConConstraints
//
//  Created by user178961 on 11/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MainProfile: UIViewController{
    
    @IBOutlet weak var profImge: IMGUIview!
    @IBOutlet weak var profName: UILabel!
    @IBOutlet weak var profStudyField: UILabel!
    @IBOutlet weak var profDistrict: UILabel!
    @IBOutlet weak var profDOB: UILabel!
    @IBOutlet weak var profPostCount: UILabel!
    @IBOutlet weak var profFollowersCount: UILabel!
    @IBOutlet weak var profFollowingCount: UILabel!
        
    @IBAction func clickBtnCerrarrSesion(_ sender: Any){
        self.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    override func viewDidLoad() {
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
        
        super.viewDidLoad()
    }
}
