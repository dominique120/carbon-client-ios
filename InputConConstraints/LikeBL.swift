//
//  LikeBL.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class LikeBL {
    
    class func getLikesByPost(_ success: @escaping Likes, postId: String) {
                
        LikeWS.getLikesByPost({(arrayLikes) in
            success(arrayLikes)
        }, postId: postId)
    }
    
    class func newLike(postId: String, personId: String ) {
        LikeWS.newLike(postId: postId, personId: personId)
    }
}
