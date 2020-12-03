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
    @IBOutlet weak var viewComments: UIButton!
    
    
    var objPost: Post! {
        didSet {
            self.updateData()
        }
    }
    
    private func updateData() {
        
        self.personName.setTitle(self.objPost.personId, for: .normal)
        self.imgPost.downloadImageInUrlString(self.objPost.pictureURL) { (image, urlString) in
            if self.objPost.pictureURL == urlString {
                self.imgPost.image = image
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        self.imgPost.layer.cornerRadius = 20
    }
}
