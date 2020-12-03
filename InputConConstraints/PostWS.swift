//
//  PostWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias Posts = (_ arrayDiscs: [Post]) -> Void

class PostWS {
    
    class func getAllPosts(_ success: @escaping Posts) {
        
        WebServiceManager.doRequest(.get, urlString: Constants.api_base_url + "/getposts") { (responseService) in
            
            let json = responseService as? [JSON] ?? []
            //let products = json["productos"] as? JSON ?? [:]
            //let discsWS = products["discos"] as? [JSON] ?? []
            
            var arrayDiscs = [Post]()
            
            for element in json {
                let obj = Post(json: element)
                arrayDiscs.append(obj)
            }
            
            success(arrayDiscs)
        }
    }
    
    class func newPost(_ success: @escaping Success, img: String, postBody: String, personId: String, posterName: String) {
        
        let json : WebServiceManager.JSON = ["mainContent"   : postBody,
                                             "personId"     : personId,
                                             "posterName"         : posterName,
                                             "timesLiked"      : "0",
                                             "timesCommented"      : "0",
                                             "pictureUrl"      : img]
        
        WebServiceManager.doRequest(.post, urlString: Constants.api_base_url + "/newpost", bodyParams: json) { (response) in
            print(response ?? "SIN RESPUESTA")
            success()
        }
    }
    
}
