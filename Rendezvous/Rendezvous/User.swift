//
//  User.swift
//  Rendezvous
//
//  Created by MediaLab on 3/23/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import Parse

class User: NSObject {
    var name: String?
    var username: String?
    var status: String?
    var image: PFFile?
    var allowLocation: Bool?
    var lat: Double?
    var long: Double?
    
    init(obj: PFObject) {
        super.init()
        
        image = obj["image"] as? PFFile
        name = obj["nickname"] as? String
        username = obj["username"] as? String
        status = obj["status"] as? String
        allowLocation = obj["shareLocation"] as? Bool
        lat = obj["lat"] as? Double
        long = obj["long"] as? Double
    }
    
    class func fetchUsersWithCompletion(completion completion:([PFObject]?, NSError?) -> ()) {
        let query = PFUser.query()
        query?.whereKey("username", notEqualTo: PFUser.currentUser()!.username!)
        query?.findObjectsInBackgroundWithBlock(completion)
    }
    
    class func createUserArray(array: [PFObject]) -> [User] {
        var users = [User]()
        for obj in array {
            users.append(User(obj: obj))
        }
        return users
    }
}
