//
//  MyPostsCell.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/7/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol MyPostsDelegate {
    func placeTableViewCell(_ cell: MyPostsCell, deletePlace objPlace: PostBE)
}

class MyPostsCell: UITableViewCell {
    
    @IBOutlet weak var posterName: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var commentText: UILabel!
    
    @IBAction func likePostButton(_ sender: Any) {
    }
    
    @IBAction func viewCommentsButton(_ sender: Any) {
        g_activePostId = objPost.postId
        self.delegate?.placeTableViewCell(self, deletePlace: self.objPost)
    }
    
    
    var delegate: MyPostsDelegate?
    
    var objPost: PostBE! {
        didSet {
            self.updateData()
        }
    }
    
    private func updateData() {
        self.commentText.text = self.objPost.mainContent
        
        self.postImage.downloadImageInUrlString(Constants.image_fs + self.objPost.pictureUrl) { (image, urlString) in
            self.postImage.image = image
        }
        self.posterName.setTitle(self.objPost.posterName, for: .normal)
    }
    
    override func draw(_ rect: CGRect) {
        self.postImage.layer.cornerRadius = 20
    }
    
    @IBAction func likePost(_ sender: Any) {
        LikeWS.newLike(postId: objPost.postId, personId: PersonBE.shared!.personId, success: {
            // print a message or something
            // or change button color
            print("Le diste like a la publicacion!")
            //(UIApplication.shared.delegate as! AppDelegate).window.sc
        }, error: {
            (errorMessage) in
            print(errorMessage)
        })
    }
}

