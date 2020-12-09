//
//  PersonWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PersonWS {
    
    class func getPersonByUserId(_ personId: String, success: @escaping Person, error: @escaping ErrorMessage) {
        
        CSWebServiceManager.shared.request.getRequest(urlString: WebServicesURL.getPersonByUserId(personId), parameters: nil) { (response) in
            
            if let personws = response.JSON?.array.first, response.errorCode == 200 {
                success(PersonBE(json: personws))
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
    
    
    class func getPersonByPersonId(_ personId: String, success: @escaping Person, error: @escaping ErrorMessage) {
        
        CSWebServiceManager.shared.request.getRequest(urlString: WebServicesURL.getPersonByPersonId(personId), parameters: nil) { (response) in
            
            if let personws = response.JSON?.array.first, response.errorCode == 200 {
                success(PersonBE(json: personws))
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
    
    class func editPerson(personId: String, firstName: String, lastName: String, displayName: String, _ success: @escaping Success, error: @escaping ErrorMessage) {
        
        let dic: [String: Any] = ["firstName"     : firstName,
                                  "lastName"        : lastName,
                                  "displayName"      : displayName
                                    ]
        
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.editPerson(personId), parameters: dic) { (response) in
            
            if response.errorCode == 201 {
                success()
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
    
}
