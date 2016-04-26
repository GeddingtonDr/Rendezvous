//
//  Event.swift
//  Rendezvous
//
//  Created by MediaLab on 4/26/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import Parse

class Event: NSObject {
    
    var name: String?
    var locationName: String?
    var startingTime: NSDate?
    var endingTime: NSDate?
    
    init(obj: PFObject) {
        super.init()
        
        name = obj["name"] as? String
        locationName = obj["locationName"] as? String
        startingTime = obj["startingTime"] as? NSDate
        endingTime = obj["endingTime"] as? NSDate
        
    }
    
    class func fetchEventsWithCompletion(completion completion:([PFObject]?, NSError?) -> ()) {
        let query = PFQuery(className: "Event")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.findObjectsInBackgroundWithBlock(completion)
    }
    
    class func createEventArray(array: [PFObject]) -> [Event] {
        var events = [Event]()
        for obj in array {
            events.append(Event(obj: obj))
        }
        return events
    }
    
    

}
