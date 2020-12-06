//
//  Entities.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 11/25/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class FollowerBE {
    var followId: String = "";
    var followerId: String = "";
    var followedId: String = "";
    
    init(json: CSJSON) {
        self.followId         = json.dictionary["followId"]?.stringValue ?? ""
        self.followerId       = json.dictionary["followerId"]?.stringValue ?? ""
        self.followedId       = json.dictionary["followedId"]?.stringValue ?? ""
    }
}
