//
//  EventsViewController.swift
//  Rendezvous
//
//  Created by MediaLab on 4/26/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import Parse

class EventsViewController: UIViewController, UITableViewDataSource {
    
    var events: [Event]!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        Event.fetchEventsWithCompletion{ (events: [PFObject]?, error: NSError?) -> () in
            if error == nil {
                self.events = Event.createEventArray(events!)
                print("got the request back")
                //self.tableView.reloadData()
            } else {
                print("No Users found")
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let events = events {
            return events.count
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as! EventCell
        // set cell to vertex
        
        //cell.user = users[indexPath.row]
        
        //cell.vertex = vertices![indexPath.row]
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
