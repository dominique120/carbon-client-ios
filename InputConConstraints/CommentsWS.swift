//
//  CommentsWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation


typealias Comments = (_ arrayComments: [Comment]) -> Void

class CommentWS {
    
    class func getCommentsByPost(_ success: @escaping Comments, postId: String) {
        
        WebServiceManager.doRequestWithMethod(.get, urlString: Constants.api_base_url + "/comments?id=" + postId, requestBody: nil) { (responseService) in
            
            let json = responseService as? [JSON] ?? []
            //let products = json["productos"] as? JSON ?? [:]
            //let discsWS = products["discos"] as? [JSON] ?? []
            
            var arrayComments = [Comment]()
            
            for element in json {
                let obj = Comment(json: element)
                arrayComments.append(obj)
            }            
            success(arrayComments)
        }
    }
    
    
    
    class func newComment(comment: Comment) {
        

        // insert dictionary converting thing etc etc
        
        WebServiceManager.doRequestWithMethod(.post, urlString: Constants.api_base_url + "/comments", requestBody: nil) { (responseService) in
            
            let json = responseService as? [JSON] ?? []
            //let products = json["productos"] as? JSON ?? [:]
            //let discsWS = products["discos"] as? [JSON] ?? []
            
            var arrayComments = [Comment]()
            
            for element in json {
                let obj = Comment(json: element)
                arrayComments.append(obj)
            }
            //success(arrayComments)
        }
    }
}
