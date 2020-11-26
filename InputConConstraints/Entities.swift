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
}


class User {
    var userName: String = "";
    var password: String = "";
}

class Person {
    var personId: String = "";
    var displayName: String = "";
    var email: String = "";
    var firstName: String = "";
    var lastName: String = "";
    var profilePictureURL: String = "";
}

class Profile: Person  {
    var profileId: String = "";
    var profileSummary: String = "";
    var studyField: String = "";
    var district: String = "";
    var birthDate: String = "";
}

class Comment {
    var commentId: String = "";
    var postId: String = "";
    var personId: String = "";
    var commentText: String = "";
}

class Like {
    var likeId: String = "";
    var postId: String = "";
    var personId: String = "";
}

class Follower {
    var followId: String = "";
    var followerId: String = "";
    var followedId: String = "";
}
