//
//  ProfileWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/7/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class ProfileWS {
    
    class func getProfileByPersonId(_ personId: String, success: @escaping Profile, error: @escaping ErrorMessage) {
        
        CSWebServiceManager.shared.request.getRequest(urlString: WebServicesURL.getProfileByPersonId(personId), parameters: nil) { (response) in
            if let profilews = response.JSON?.array.first, response.errorCode == 200 {
                success(ProfileBE(json: profilews))
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
}
