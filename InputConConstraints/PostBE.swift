//
//  PostBE.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PostBE {
    var postId: String = "";
    var personId: String = "";
    var mainContent: String = "";
    var pictureUrl: String = "";
    var posterName: String = "";
    
    // extra types
    var timesLiked: Int = 0;
    var timesCommented: Int = 0;
    
    init(json: CSJSON) {
        self.postId             = json.dictionary["postId"]?.stringValue ?? ""
        self.personId           = json.dictionary["personId"]?.stringValue ?? ""
        self.mainContent        = json.dictionary["mainContent"]?.stringValue ?? ""
        self.pictureUrl         = json.dictionary["pictureUrl"]?.stringValue ?? ""
        self.posterName         = json.dictionary["posterName"]?.stringValue ?? ""
        self.timesLiked         = Int(json.dictionary["posterName"]?.stringValue ?? "") ?? 0
        self.timesCommented     = Int(json.dictionary["timesCommented"]?.stringValue ?? "") ?? 0
    }
}
