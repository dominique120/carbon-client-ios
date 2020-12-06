//
//  LikeBE.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class LikeBE {
    var likeId: String = "";
    var postId: String = "";
    var personId: String = "";
    
    init(json: CSJSON) {
        self.likeId           = json.dictionary["likeId"]?.stringValue ?? ""
        self.postId           = json.dictionary["postId"]?.stringValue ?? ""
        self.personId         = json.dictionary["personId"]?.stringValue ?? ""
    }
}
