//
//  LikeWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class LikeWS {
    
    class func getLikesByPost(_ postId: String, success: @escaping Likes, error: @escaping ErrorMessage) {
        
        CSWebServiceManager.shared.request.getRequest(urlString: WebServicesURL.getCommentsByPost(postId), parameters: nil) { (response) in
            if response.errorCode == 200 {
                let likeWS = response.JSON?.array ?? []
                var arrayLikes = [LikeBE]()
                
                for element in likeWS{
                    let objLike = LikeBE(json: element)
                    arrayLikes.append(objLike)
                }
                success(arrayLikes)
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
    
    class func newLike(postId: String, personId: String, success: @escaping Success, error: @escaping ErrorMessage) {
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.likePost(postId, personId), parameters: nil) { (response) in
            
            if response.errorCode == 201 {
                success()
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }        
    }
}

