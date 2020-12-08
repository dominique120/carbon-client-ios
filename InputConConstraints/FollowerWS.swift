//
//  FollowerWS.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/8/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
class FollowerWS {
    class func followSomeone(followerId: String, followingId: String, success: @escaping Success, error: @escaping ErrorMessage) {
        CSWebServiceManager.shared.request.postRequest(urlString: WebServicesURL.followSomeone(followerId, followingId), parameters: nil) { (response) in
            if response.errorCode == 201 {
                success()
            }else{
                error(StatusCodeBE.getErrorMessageByStatusCode(response.errorCode))
            }
        }
        
    }
}
