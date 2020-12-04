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
        
        WebServiceManager.doRequest(.post, urlString: Constants.api_base_url + "/getpostcomments?id=" + postId) { (responseService) in
            
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
    
    
    
    class func newComment(_ success: @escaping Success, postId: String, commentText: String, personId: String) {
        
        let json : WebServiceManager.JSON = ["postId"       : postId,
                                             "personId"     : personId,
                                             "commentText"  : commentText
                                             ]
        
        WebServiceManager.doRequest(.post, urlString: Constants.api_base_url + "/newcomment", bodyParams: json) { (response) in
            print(response ?? "SIN RESPUESTA")
            success()
        }
    }
}
