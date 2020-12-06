//
//  PostWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PostWS {
    
    class func getAllPosts(success: @escaping Posts, error: @escaping ErrorMessage) {
        
        
        CSWebServiceManager.shared.request.getRequest(urlString: WebServicesURL.getPosts, parameters: nil) { (response) in
            
            if response.errorCode == 200 {
                let postWS = response.JSON?.array ?? []
                var arrayPosts = [PostBE]()
                
                for element in postWS{
                    let objPost = PostBE(json: element)
                    arrayPosts.append(objPost)
                    
                }
                success(arrayPosts)
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
    
    class func newPost(_ success: @escaping Success, img: String, postBody: String, personId: String, posterName: String, error: @escaping ErrorMessage) {
        
        let dic: [String: Any] = ["mainContent"     : postBody,
                                  "personId"        : personId,
                                  "posterName"      : posterName,
                                  "timesLiked"      : "0",
                                  "timesCommented"  : "0",
                                  "pictureUrl"      : img]
        
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.newPost, parameters: dic) { (response) in
            
            if response.errorCode == 201 {
                success()                
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
    
}
