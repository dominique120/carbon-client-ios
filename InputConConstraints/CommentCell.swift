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
    
        
    var objComment: CommentBE! {
        didSet {
            self.updateData()
        }
    }
        
    private func updateData() {
        self.commentText.text = self.objComment.commentText
        
        self.profilePic.downloadImageInUrlString(Constants.image_fs + self.objComment.posterProfilePicUrl) { (image, urlString) in
            self.profilePic.image = image
        }
        self.personName.setTitle(self.objComment.posterName, for: .normal)
    }
    

}

