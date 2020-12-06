//
//  Closures.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/3/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

// sinle object
typealias User          = (_ objUser: UserBE) -> Void
typealias Person        = (_ objPerson: PersonBE) -> Void
typealias Like          = (_ objLike: LikeBE) -> Void
typealias Comment       = (_ objComment: CommentBE) -> Void
typealias Follower      = (_ objFollower: FollowerBE) -> Void
typealias Post          = (_ objPost: PostBE) -> Void
typealias Profile       = (_ objProfile: ProfileBE) -> Void

// arrays
typealias Posts         = (_ arrayPosts: [PostBE]) -> Void
typealias People        = (_ arrayPersons: [PersonBE]) -> Void
typealias Comments      = (_ arrayComments: [CommentBE]) -> Void
typealias Likes         = (_ arrayComments: [LikeBE]) -> Void
typealias Profiles      = (_ arrayProfiles: [ProfileBE]) -> Void
typealias Users         = (_ arrayUsers: [UserBE]) -> Void
typealias Followers     = (_ arrayFollowers: [FollowerBE]) -> Void

// UTIL
typealias Success       = () -> Void
typealias ErrorMessage  = (_ errorMessage: String) -> Void
