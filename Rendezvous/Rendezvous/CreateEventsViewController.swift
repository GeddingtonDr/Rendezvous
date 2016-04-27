//
//  CreateEventsViewController.swift
//  Rendezvous
//
//  Created by MediaLab on 4/26/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import Parse

class CreateEventsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCreateEvent(sender: AnyObject) {
        let event = PFObject(className: "Event")
        
        event["name"] = nameTextField.text
        event["locationTextField"] = locationTextField.text
        
        event["startingTime"] = startDatePicker.date
        
        event.saveInBackgroundWithBlock { (saved: Bool?, error: NSError?) -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func onCancelPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
