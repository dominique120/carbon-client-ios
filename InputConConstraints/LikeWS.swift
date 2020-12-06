//
//  LikeWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias Likes = (_ arrayComments: [LikeBE]) -> Void

class LikeWS {
    
    class func getLikesByPost(_ success: @escaping Likes, postId: String) {
        
        WebServiceManager.doRequest(.get, urlString: Constants.api_base_url + "/likes?id=" + postId) { (responseService) in
            
            let json = responseService as? [JSON] ?? []
            //let products = json["productos"] as? JSON ?? [:]
            //let discsWS = products["discos"] as? [JSON] ?? []
            
            var arrayLikes = [LikeBE]()
            
            for element in json {
                let obj = LikeBE(json: element)
                arrayLikes.append(obj)
            }
            success(arrayLikes)
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

