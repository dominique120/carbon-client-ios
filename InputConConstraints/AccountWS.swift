//
//  AccountWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
class AccountWS{
    class func createAccount(_ success: @escaping Success, _ error: @escaping ErrorMessage, username: String, password: String,  displayName: String, email: String, firstName: String, lastName: String) {
        
        let dic: [String: Any]  = ["userName"       : username,
                                   "password"       : password,
                                   "displayName"    : displayName,
                                   "email"          : email,
                                   "firstName"      : firstName,
                                   "lastName"       : lastName
        ]
        
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.newUser, parameters: dic) { (response) in
            if  response.errorCode == 201 {
                success()
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
}
