//
//  WSUtil.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class StatusCodeBE {
    
    class func getErrorMessageByStatusCode(_ statusCode: Int) -> String {
        
        switch statusCode {
        case 200:
            return "OK"
        case 201:
            return "Created"
        case 204:
            return "No content"
        case 400:
            return "Malformed request"
        case 403:
            return "Not authorized"
        case 404:
            return "Not found"
        default:
            return "No conection"
        }
    }
}
