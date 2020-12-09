//
//  Constants.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 11/15/20.
//  Copyright © 2020 Dominique Verellen. All rights reserved.
//


struct Constants {
    private static let ip = "190.238.243.95"
    private static let port = "80"
    
    public static let api_base_url = "http://" + ip + ":" + port + "/isilinsta"
    
    public static let image_fs = "http://" + ip + ":" + port + "/img_store"
}


struct WebServicesURL {
    static let login = Constants.api_base_url + "/validate_user"
    static let newPost = Constants.api_base_url + "/newpost"
    static let getPosts = Constants.api_base_url + "/getposts"
    static let newComment = Constants.api_base_url + "/newcomment"
    static let newUser = Constants.api_base_url + "/new_user"
    static let uploadImage = Constants.api_base_url + "/img_uploader"
    
    static func getCommentsByPost(_ postId: String) -> String {
        return Constants.api_base_url + "/getpostcomments?id=\(postId)"
    }
    
    static func getLikesByPost(_ postId: String) -> String {
        return Constants.api_base_url + "/likes?id=\(postId)"
    }
    
    static func getPersonByUserId(_ personId: String) -> String {
        return Constants.api_base_url + "/personbyuser?id=\(personId)"
    }
    
    static func getPersonByPersonId(_ personId: String) -> String {
        return Constants.api_base_url + "/personbyid?id=\(personId)"
    }
    
    static func getProfileByPersonId(_ personId: String) -> String {
        return Constants.api_base_url + "/profilebyperson?id=\(personId)"
    }
    
    static func likePost(_ postId: String, _ personId: String) -> String {
        return Constants.api_base_url + "/likepost?postId=\(postId)&personId=\(personId)"
    }
    
    static func getPostsByPerson(_ postId: String) -> String {
        return Constants.api_base_url + "/postsbyperson?id=\(postId)"
    }
    
    static func followSomeone(_ myFollowerId: String, _ theirFollowingId: String) -> String {
        return Constants.api_base_url + "/follow?followerId=\(myFollowerId)&followedId=\(theirFollowingId)"
    }
    
    static func deletePost(_ postId: String) -> String {
        return Constants.api_base_url + "/deletepost?id=\(postId)"
    }
    
}
