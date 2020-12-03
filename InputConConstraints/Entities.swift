//
//  Entities.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 11/25/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

class Post {
    var postId: String = "";
    var personId: String = "";
    var mainContent: String = "";
    var pictureURL: String = "";
    var posterName: String = "";
    
    // extra types
    var timesLiked: Int = 0;
    var timesCommented: Int = 0;
    
    init(json: JSON) {
        self.postId             = json["postId"]            as? String ?? ""
        self.personId           = json["personId"]          as? String ?? ""
        self.mainContent        = json["mainContent"]       as? String ?? ""
        self.pictureURL         = json["pictureURL"]        as? String ?? ""
        self.posterName         = json["posterName"]        as? String ?? ""
        self.timesLiked         = Int(json["timesLiked"]        as? String ?? "") ?? 0
        self.timesCommented     = Int(json["timesCommented"]    as? String ?? "") ?? 0
    }
}


class User {
    var personId: String = "";
    var userName: String = "";
    var password: String = "";
    
    
    init(json: JSON) {
        self.personId             = json["personId"]            as? String ?? ""
        self.userName           = json["userName"]          as? String ?? ""
        self.password           = json["password"]          as? String ?? ""
    }
}

class Person {
    var personId: String = "";
    var profileId: String = "";
    var displayName: String = "";
    var email: String = "";
    var firstName: String = "";
    var lastName: String = "";
    var profilePictureURL: String = "";
    
    init(json: JSON) {
        self.personId             = json["personId"]           as? String ?? ""
        self.profileId            = json["profileId"]          as? String ?? ""
        self.displayName          = json["displayName"]        as? String ?? ""
        self.email                = json["email"]              as? String ?? ""
        self.firstName            = json["firstName"]          as? String ?? ""
        self.lastName             = json["lastName"]           as? String ?? ""
        self.profilePictureURL    = json["profilePictureURL"]  as? String ?? ""
    }
}

class Profile {
    var profileId: String = "";
    var profileSummary: String = "";
    var studyField: String = "";
    var district: String = "";
    var birthDate: String = "";
    
    // extra types
    var followersCount: Int = 0;    
    
    init(json: JSON) {
        self.profileId          = json["profileId"]            as? String ?? ""
        self.profileSummary     = json["profileSummary"]       as? String ?? ""
        self.studyField         = json["studyField"]           as? String ?? ""
        self.district           = json["district"]             as? String ?? ""
        self.birthDate          = json["birthDate"]            as? String ?? ""
        self.followersCount     = Int(json["followersCount"]   as? String ?? "") ?? 0
    }
}

class Comment {
    var commentId: String = "";
    var postId: String = "";
    var personId: String = "";
    var commentText: String = "";
    
    init(json: JSON) {
        self.commentId        = json["commentId"]      as? String ?? ""
        self.postId           = json["postId"]         as? String ?? ""
        self.personId         = json["personId"]       as? String ?? ""
        self.commentText      = json["commentText"]    as? String ?? ""
    }
}

class Like {
    var likeId: String = "";
    var postId: String = "";
    var personId: String = "";
    
    init(json: JSON) {
        self.likeId           = json["likeId"]      as? String ?? ""
        self.postId           = json["postId"]      as? String ?? ""
        self.personId         = json["personId"]    as? String ?? ""
    }
}

class Follower {
    var followId: String = "";
    var followerId: String = "";
    var followedId: String = "";
    
    init(json: JSON) {
        self.followId         = json["followId"]      as? String ?? ""
        self.followerId       = json["followerId"]    as? String ?? ""
        self.followedId       = json["followedId"]    as? String ?? ""
    }
}
