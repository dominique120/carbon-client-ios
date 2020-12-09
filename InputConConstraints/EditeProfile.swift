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
    
    // Add image outlet and loader
    
    
    @IBAction  func clickBtnBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        studyField.text = ProfileBE.shared?.studyField
        district.text = ProfileBE.shared?.district
        DOB.text = ProfileBE.shared?.birthDate
        name.text = PersonBE.shared!.firstName + " " + PersonBE.shared!.lastName
        super.viewWillAppear(animated)
    }
    
    
}
