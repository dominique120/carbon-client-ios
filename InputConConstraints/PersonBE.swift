//
//  PersonBE.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PersonBE {
    
    static var shared: PersonBE?
    
    var personId: String = "";
    var profileId: String = "";
    var displayName: String = "";
    var email: String = "";
    var firstName: String = "";
    var lastName: String = "";
    var profilePictureURL: String = "";
    
    init(json: CSJSON) {
        self.personId             = json.dictionary["personId"]?.stringValue ?? ""
        self.profileId            = json.dictionary["profileId"]?.stringValue ?? ""
        self.displayName          = json.dictionary["displayName"]?.stringValue ?? ""
        self.email                = json.dictionary["email"]?.stringValue ?? ""
        self.firstName            = json.dictionary["firstName"]?.stringValue ?? ""
        self.lastName             = json.dictionary["lastName"]?.stringValue ?? ""
        self.profilePictureURL    = json.dictionary["profilePictureURL"]?.stringValue ?? ""
    }
}
