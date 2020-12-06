//
//  Comment.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/6/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class CommentBE {
    var commentId: String = "";
    var postId: String = "";
    var personId: String = "";
    var commentText: String = "";
    
    init(json: CSJSON) {
        self.commentId        = json.dictionary["commentId"]?.stringValue ?? ""
        self.postId           = json.dictionary["postId"]?.stringValue ?? ""
        self.personId         = json.dictionary["personId"]?.stringValue ?? ""
        self.commentText      = json.dictionary["commentText"]?.stringValue ?? ""
    }
}
