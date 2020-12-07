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
    
    var poster: PersonBE!
    
    var objComment: CommentBE! {
        didSet {
            self.updateData()
        }
    }
        
    private func updateData() {
        self.getPoster(personId: objComment.personId)
        self.commentText.text = self.objComment.commentText
        /*
        self.imgPost.downloadImageInUrlString(Constants.image_fs + self.objPost.pictureUrl) { (image, urlString) in
            self.imgPost.image = image
        }*/
        //self.personName.setTitle(self.poster.displayName, for: .normal)
    }
    
    
    func getPoster(personId: String) {        
        PersonWS.getPersonByPersonId(personId, success: {(person) in
            self.poster = person
        }, error: {(errorMessage) in
            print(errorMessage)
        })
    }
}

