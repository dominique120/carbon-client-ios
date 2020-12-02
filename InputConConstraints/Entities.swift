//
//  Entities.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 11/25/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class Post {
    var postId: String = "";
    var personId: String = "";
    var mainContent: String = "";
    var pictureURL: String = "";
    
    // extra types
    var timesLiked: Int = 0;
    var timesCommented: Int = 0;
    
    
    init(dictionary: [String: Any]) {
        self.postId             = dictionary["postId"]            as? String ?? ""
        self.personId           = dictionary["personId"]          as? String ?? ""
        self.mainContent        = dictionary["mainContent"]       as? String ?? ""
        self.pictureURL         = dictionary["pictureURL"]        as? String ?? ""
        self.timesLiked         = Int(dictionary["timesLiked"]        as? String ?? "") ?? 0
        self.timesCommented     = Int(dictionary["timesCommented"]    as? String ?? "") ?? 0
    }
}


class User {
    var userId: String = "";
    var userName: String = "";
    var password: String = "";
    
    
    init(dictionary: [String: Any]) {
        self.userId             = dictionary["userId"]            as? String ?? ""
        self.userName           = dictionary["userName"]          as? String ?? ""
        self.password           = dictionary["password"]          as? String ?? ""
    }
}

class Person {
    var personId: String = "";
    var userId: String = "";
    var profileId: String = "";
    var displayName: String = "";
    var email: String = "";
    var firstName: String = "";
    var lastName: String = "";
    var profilePictureURL: String = "";
    
    init(dictionary: [String: Any]) {
        self.personId             = dictionary["personId"]           as? String ?? ""
        self.userId               = dictionary["userId"]             as? String ?? ""
        self.profileId            = dictionary["profileId"]          as? String ?? ""
        self.displayName          = dictionary["displayName"]        as? String ?? ""
        self.email                = dictionary["email"]              as? String ?? ""
        self.firstName            = dictionary["firstName"]          as? String ?? ""
        self.lastName             = dictionary["lastName"]           as? String ?? ""
        self.profilePictureURL    = dictionary["profilePictureURL"]  as? String ?? ""
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
    
    
    init(dictionary: [String: Any]) {
        self.profileId          = dictionary["profileId"]            as? String ?? ""
        self.profileSummary     = dictionary["profileSummary"]       as? String ?? ""
        self.studyField         = dictionary["studyField"]           as? String ?? ""
        self.district           = dictionary["district"]             as? String ?? ""
        self.birthDate          = dictionary["birthDate"]            as? String ?? ""
        self.followersCount     = Int(dictionary["followersCount"]   as? String ?? "") ?? 0
    }
}

class Comment {
    var commentId: String = "";
    var postId: String = "";
    var personId: String = "";
    var commentText: String = "";
    
    init(dictionary: [String: Any]) {
        self.commentId        = dictionary["commentId"]      as? String ?? ""
        self.postId           = dictionary["postId"]         as? String ?? ""
        self.personId         = dictionary["personId"]       as? String ?? ""
        self.commentText      = dictionary["commentText"]    as? String ?? ""
    }
}

class Like {
    var likeId: String = "";
    var postId: String = "";
    var personId: String = "";
    
    init(dictionary: [String: Any]) {
        self.likeId           = dictionary["likeId"]      as? String ?? ""
        self.postId           = dictionary["postId"]      as? String ?? ""
        self.personId         = dictionary["personId"]    as? String ?? ""
    }
}

class Follower {
    var followId: String = "";
    var followerId: String = "";
    var followedId: String = "";
    
    init(dictionary: [String: Any]) {
        self.followId         = dictionary["followId"]      as? String ?? ""
        self.followerId       = dictionary["followerId"]    as? String ?? ""
        self.followedId       = dictionary["followedId"]    as? String ?? ""
    }
}
