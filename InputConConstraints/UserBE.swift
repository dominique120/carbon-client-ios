//
//  UserBE.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation


class UserBE {
    
    static var shared: UserBE?
    
    var personId: String = "";
    var userName: String = "";
    var password: String = "";
        
    init(json: CSJSON) {
        self.personId = json.dictionary["personId"]?.stringValue ?? ""
        self.userName = json.dictionary["userName"]?.stringValue ?? ""
        self.password = json.dictionary["password"]?.stringValue ?? ""
    }
}
