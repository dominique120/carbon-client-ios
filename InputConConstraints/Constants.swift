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
    
    static func getProfileByUserId(_ personId: String) -> String {
        return Constants.api_base_url + "/personbyuser?id=\(personId)"
    }
    
    static func getProfileByPersonId(_ personId: String) -> String {
        return Constants.api_base_url + "/personbyid?id=\(personId)"
    }
    
    static func likePost(_ postId: String, _ personId: String) -> String {
        return Constants.api_base_url + "/likepost?postId=\(postId)&personId=\(personId)"
    }
    
}
