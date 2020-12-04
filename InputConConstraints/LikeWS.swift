//
//  LikeWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias Likes = (_ arrayComments: [Like]) -> Void

class LikeWS {
    
    class func getLikesByPost(_ success: @escaping Likes, postId: String) {
        
        WebServiceManager.doRequest(.get, urlString: Constants.api_base_url + "/likes?id=" + postId) { (responseService) in
            
            let json = responseService as? [JSON] ?? []
            //let products = json["productos"] as? JSON ?? [:]
            //let discsWS = products["discos"] as? [JSON] ?? []
            
            var arrayLikes = [Like]()
            
            for element in json {
                let obj = Like(json: element)
                arrayLikes.append(obj)
            }
            success(arrayLikes)
        }
    }
    
    class func newLike(postId: String, personId: String ) {
    WebServiceManager.doRequest(.post, urlString: Constants.api_base_url + "/likepost?postId=" + postId + "&personId=" + personId) { (responseService) in

    }
}
}