//
//  AuthWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/3/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation



class AuthWS {
        
    class func doLogin(password: String, username: String, success: @escaping Success) {
        
        let json : WebServiceManager.JSON = ["username"   : username,
                                             "password"     : password]

        WebServiceManager.doRequest(.post, urlString: Constants.api_base_url + "/validate_user", bodyParams: json, wait: true) { (response) in
            print(response ?? "SIN RESPUESTA")
                       
            
            let json = response as? [JSON] ?? []
            
            var user = [User]()
            
            for element in json {
                let obj = User(json: element)
                user.append(obj)
            }
            
            g_personId = user.first?.personId ?? "-1"
            
            success()
        }
    }
}
