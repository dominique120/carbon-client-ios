//
//  ProfileBE.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation


class ProfileBE {
    var profileId: String = "";
    var profileSummary: String = "";
    var studyField: String = "";
    var district: String = "";
    var birthDate: String = "";
    
    // extra types
    var followersCount: Int = 0;
    
    init(json: CSJSON) {
        self.profileId          = json.dictionary["profileId"]?.stringValue ?? ""
        self.profileSummary     = json.dictionary["profileSummary"]?.stringValue ?? ""
        self.studyField         = json.dictionary["studyField"]?.stringValue ?? ""
        self.district           = json.dictionary["district"]?.stringValue ?? ""
        self.birthDate          = json.dictionary["birthDate"]?.stringValue ?? ""
        self.followersCount     = Int(json.dictionary["followersCount"]?.stringValue ?? "") ?? 0
    }
}
