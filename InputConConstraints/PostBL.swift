//
//  PostBL.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PostBL {
    
    class func getAllPosts(_ success: @escaping Posts) {
        
        PostWS.getAllPosts { (arrayPosts) in
            success(arrayPosts)
        }
    }
    
    class func newPost(_ success: @escaping Success, img: String, postBody: String, personId: String, posterName: String ) {
        
        PostWS.newPost({
            success()
        }, img:img, postBody:postBody, personId:personId, posterName:posterName)
    }
}
