//
//  AuthWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/3/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class AuthWS {
        
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
}




/*
class AuthWS {
        
    class func doLogin(password: String, username: String, success: @escaping Success) {
        
        let json : WebServiceManager.JSON = ["username"   : username,
                                             "password"     : password]

        WebServiceManager.doRequest(.post, urlString: Constants.api_base_url + "/validate_user", bodyParams: json, wait: true) { (response) in
            print(response ?? "SIN RESPUESTA")
                       
            
            let json = response as? [JSON] ?? []
            
            var user = [User]()
            
            for element in json {
                let obj = UserBE(json: element)
                user.append(obj)
            }
            
            g_personId = user.first?.personId ?? "-1"
            
            success()
        }
    }
}
*/
