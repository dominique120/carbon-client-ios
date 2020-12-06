//
//  CommentsWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class CommentWS {
     
    class func getCommentsByPost(_ postId: String,success: @escaping Comments, error: @escaping ErrorMessage) {
        
        CSWebServiceManager.shared.request.getRequest(urlString: WebServicesURL.getCommentsByPost(postId), parameters: nil) { (response) in
            
            if response.errorCode == 200 {
                let commentWS = response.JSON?.array ?? []
                var arrayComments = [CommentBE]()
                
                for element in commentWS{
                    let objComment = CommentBE(json: element)
                    arrayComments.append(objComment)
                }
                success(arrayComments)
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
    
    
    
    class func newComment(_ success: @escaping Success, _ error: @escaping ErrorMessage, postId: String, commentText: String, personId: String) {
        
        let dic: [String: Any]  = ["postId"       : postId,
                                   "personId"     : personId,
                                   "commentText"  : commentText
        ]
        
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.newComment, parameters: dic) { (response) in
            if  response.errorCode == 201 {                
                success()
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
}
