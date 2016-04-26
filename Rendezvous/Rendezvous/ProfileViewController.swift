//
//  ProfileViewController.swift
//  Rendezvous
//
//  Created by MediaLab on 4/13/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import Parse
import ALCameraViewController

class ProfileViewController: UIViewController {

    @IBOutlet weak var saveChangesButton: UIButton!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var shareLocationSwitch: UISwitch!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageButton.imageView?.layer.cornerRadius = 53
        saveChangesButton.layer.borderColor = logoutButton.layer.backgroundColor
        saveChangesButton.layer.borderWidth = 0
        
        if let user = PFUser.currentUser() {
            if let nickname = user["nickname"] {
                nicknameTextField.placeholder = nickname as! String
            } else {
                nicknameTextField.placeholder = "Enter a nickname"
            }
            if let status = user["status"] {
                statusTextField.placeholder = status as! String
            } else {
                statusTextField.placeholder = "Enter your status"
            }
            
            if let sharelocation = user["shareLocation"] {
                shareLocationSwitch.setOn(sharelocation as! Bool, animated: false)
            }
        }
    }

    @IBAction func onProfileImageButton(sender: AnyObject) {
        let croppingEnabled = true
        let cameraViewController = ALCameraViewController(croppingEnabled: croppingEnabled) { image in
            if image != nil {
                self.profileImageButton.setImage(image, forState: .Normal)
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        presentViewController(cameraViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) in
            // PFUser.currentUser() will now be nil
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSaveChanges(sender: AnyObject) {
        if let user = PFUser.currentUser() {
            
            if nicknameTextField.text != "" {
                user["nickname"] = nicknameTextField.text
            }
            
            if statusTextField.text != "" {
                user["status"] = statusTextField.text
            }
            
            user.saveInBackground()
            
            nicknameTextField.text = nil
            statusTextField.text = nil
            
            nicknameTextField.placeholder = user["nickname"] as! String
            statusTextField.placeholder = user["status"] as! String
        }
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
