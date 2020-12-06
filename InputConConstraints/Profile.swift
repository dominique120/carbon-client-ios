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
    @IBAction func clickBtnCerrarrSesion(_ sender: Any){
        self.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
}
