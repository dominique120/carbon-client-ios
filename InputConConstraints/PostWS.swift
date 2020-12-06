//
//  PostWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias Posts = (_ arrayDiscs: [PostBE]) -> Void

class PostWS {
    
    class func getAllPosts(_ success: @escaping Posts) {
        
        WebServiceManager.doRequest(.get, urlString: Constants.api_base_url + "/getposts") { (responseService) in
            
            let json = responseService as? [JSON] ?? []
            
            var arrayDiscs = [PostBE]()
            
            for element in json {
                let obj = PostBE(json: element)
                arrayDiscs.append(obj)
            }
            
            success(arrayDiscs)
        }
    }
    
    /*
     class func doLogin(password: String, username: String, success: @escaping User, error: @escaping ErrorMessage) {
         
         let dic: [String: Any] = ["username": username,
                                   "password": password]

         CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.login, parameters: dic) { (response) in
             
             if let userws = response.JSON?.array.first, response.errorCode == 200 {
                 
                 let objUser = UserBE(json: userws)
                 UserBE.shared = objUser
                 success(objUser)
                 
             }else{
                 error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
             }
         }
     }
     */
    
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
