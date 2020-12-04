//
//  MainPostCell.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personName: UIButton!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var likePost: UIButton!
    @IBOutlet weak var commentOnPost: UIButton!
    @IBOutlet weak var postContent: UILabel!
    
    @IBAction func viewComments(_ sender: Any) {
        g_activePostId = objPost.postId
    }
    
    var poster: Person!
    
    var objPost: Post! {
        didSet {
            self.updateData()
        }
    }
    
    func getPoster(personId: String) {
        PersonBL.getPersonById({ (arrayPosts) in
            
            self.poster = arrayPosts.first!
            
        }, personId: personId)
    }
    
    private func updateData() {
        self.getPoster(personId: objPost.personId)
        self.postContent.text = self.objPost.mainContent
        
        self.imgPost.downloadImageInUrlString(Constants.image_fs + self.objPost.pictureUrl) { (image, urlString) in
                self.imgPost.image = image
        }
        self.personName.setTitle(self.objPost.posterName, for: .normal)
    }
    
    override func draw(_ rect: CGRect) {
        self.imgPost.layer.cornerRadius = 20
    }
    
    @IBAction func likePost(_ sender: Any) {
        LikeBL.newLike(postId: objPost.postId, personId: g_personId)
        print("le diste like a la publicacion")
        // send some visual alert
    }
    

}

