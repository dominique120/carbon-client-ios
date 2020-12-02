//
//  PostBL.swift
//  InputConConstraints
//
//  Created by Dominique Verellen on 12/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class PostBL {
    
    class func getAllPosts(_ success: @escaping Posts) {
        
        PostWS.getAllPosts { (arrayPosts) in
            
            //let arraySorted = arrayDisc.sorted(by: { $0.disc_releaseDate > $1.disc_releaseDate })
            success(arrayPosts)
        }
    }
}
