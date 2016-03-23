//
//  ContainerViewController.swift
//  Rendezvous
//
//  Created by MediaLab on 3/23/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = storyboard.instantiateViewControllerWithIdentifier("MapViewController")
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("MainViewController")
        
        self.addChildViewController(mapVC)
        self.scrollView.addSubview(mapVC.view)
        mapVC.didMoveToParentViewController(self)
        
        self.addChildViewController(mainVC)
        self.scrollView.addSubview(mainVC.view)
        mainVC.didMoveToParentViewController(self)
        
        var adminFrame :CGRect = mapVC.view.frame
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
