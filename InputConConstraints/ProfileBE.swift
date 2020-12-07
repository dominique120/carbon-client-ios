//
//  ProfileBE.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation


class ProfileBE {
    
    static var shared: ProfileBE?
    
    var profileId: String = "";
    var profileSummary: String = "";
    var studyField: String = "";
    var district: String = "";
    var birthDate: String = "";
    
    // extra types
    var followersCount: String = "0";
    var followingCount: String = "0";
    var postCount: String = "0";
    
    init(json: CSJSON) {
        self.profileId          = json.dictionary["profileId"]?.stringValue ?? ""
        self.profileSummary     = json.dictionary["profileSummary"]?.stringValue ?? ""
        self.studyField         = json.dictionary["studyField"]?.stringValue ?? ""
        self.district           = json.dictionary["district"]?.stringValue ?? ""
        self.birthDate          = json.dictionary["birthDate"]?.stringValue ?? ""
        self.followersCount     = json.dictionary["followersCount"]?.stringValue ?? "0"
        self.followingCount     = json.dictionary["followingCount"]?.stringValue ?? "0"
        self.postCount          = json.dictionary["postCount"]?.stringValue ?? "0"
    }
}
