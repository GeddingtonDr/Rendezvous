//
//  ContainerViewController.swift
//  Rendezvous
//
//  Created by MediaLab on 3/23/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import MapKit
import Parse

class ContainerViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization();
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation  //unnecessarily high accuracy
            //locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            
            locationManager.startUpdatingLocation()
            
        }
        else {
            print("Location service disabled");
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("MainViewController")
        
        self.addChildViewController(profileVC)
        self.scrollView.addSubview(profileVC.view)
        profileVC.didMoveToParentViewController(self)
        
        self.addChildViewController(mainVC)
        self.scrollView.addSubview(mainVC.view)
        mainVC.didMoveToParentViewController(self)
        
        var adminFrame :CGRect = profileVC.view.frame
        adminFrame.origin.x = adminFrame.width
        mainVC.view.frame = adminFrame
        
        let scrollWidth: CGFloat  = 2 * self.view.frame.width
        let scrollHeight: CGFloat  = self.view.frame.size.height
        self.scrollView!.contentSize = CGSizeMake(scrollWidth, scrollHeight);
        
        scrollView.contentOffset.x = self.view.frame.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
        let long = locValue.longitude
        let lat = locValue.latitude
        print(long)
        print(lat)
        
        if let _ = PFUser.currentUser() {
            PFUser.currentUser()!["lat"] = lat
            PFUser.currentUser()!["long"] = long
            
            PFUser.currentUser()!.saveInBackground()
        }
//        let para:NSMutableDictionary = NSMutableDictionary()
//        para.setValue("\(lat)", forKey: "lat")
//        para.setValue("\(long)", forKey: "long")
//        let jsonData: NSData
//        do{
//            jsonData = try NSJSONSerialization.dataWithJSONObject(para, options: NSJSONWritingOptions())
//            let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding) as! String
//            let s = (locationManager.location?.speed)!
//            
//            print(jsonString)
//            print(s)
        
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
