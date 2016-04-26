//
//  MainViewController.swift
//  Rendezvous
//
//  Created by MediaLab on 3/23/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import MapKit
import Parse
import CoreLocation

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate,CLLocationManagerDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    var vertices:[Vertex]?
    
    var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dict = NSDictionary(dictionary: ["name": "Sahil Dhanju", "location": "Home"])
        //let u1 = User(dictionary: dict)
        //let v1 = Vertex(user: u1)
        //vertices = [v1, v1, v1, v1]
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        User.fetchUsersWithCompletion { (users: [PFObject]?, error: NSError?) -> () in
            if error == nil {
                self.users = User.createUserArray(users!)
                print("got the request back")
                self.tableView.reloadData()
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
        if let users = users {
            return users.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainTableViewCell") as! MainTableViewCell
        // set cell to vertex
        
        cell.user = users[indexPath.row]
        
        //cell.vertex = vertices![indexPath.row]
        return cell
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error: " + error.localizedDescription)
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
