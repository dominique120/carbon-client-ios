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
    
    
    class func editProfile(profileId: String, studyField: String, district: String, birthDate: String, profileSummary: String, _ success: @escaping Success, error: @escaping ErrorMessage) {
        
        let dic: [String: Any] = ["profileSummary"     : profileSummary,
                                  "studyField"        : studyField,
                                  "district"      : district,
                                  "birthDate"      : birthDate
                                    ]
        
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.editprofile(profileId), parameters: dic) { (response) in
            
            if response.errorCode == 201 {
                success()
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
    }
}
