//
//  User.swift
//  Rendezvous
//
//  Created by MediaLab on 3/23/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var status: String?
    var image: UIImage?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        let location = dictionary["location"] as! String
        // time will actually be calculated from our app, based on the location between the user and the vertex
        // let time = "15min"
        // status = "\(location) | \(time)"
        status = location
        image = UIImage(named: "trash")
    }
}
