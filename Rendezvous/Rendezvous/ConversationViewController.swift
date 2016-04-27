//
//  ConversationViewController.swift
//  Rendezvous
//
//  Created by MediaLab on 4/26/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Am I in here")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDismissAction(sender: AnyObject) {
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
