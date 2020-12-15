//
//  MainCelda.swift
//  InputConConstraints
//
//  Created by user178961 on 12/3/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MainCelda : UITableViewCell{
    
    @IBOutlet weak var commentDate: UILabel!
    @IBOutlet weak var personProfilePic: UIImageView!
    @IBOutlet weak var personName: UIButton!
    @IBOutlet weak var commentText: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
        
    var objComment: CommentBE! {
        didSet {
            self.updateData()
        }
    }
        
    private func updateData() {
        activityIndicator.startAnimating()
        self.commentText.text = self.objComment.commentText
        
        PersonWS.getPersonByPersonId(objComment.personId, success: {(objPerson) in
            self.profilePic.downloadImageInUrlString(Constants.image_fs + objPerson.profilePictureUrl) { (image, urlString) in
                self.profilePic.image = image
                self.activityIndicator.stopAnimating()
            }
            self.personName.setTitle(objPerson.displayName , for: .normal)
        }, error: {(errorMessage) in
            print(errorMessage)
        })
    }
}

