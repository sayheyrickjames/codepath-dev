//
//  HamburgerViewController.swift
//  week4-class-lab-youtube
//
//  Created by Rick James! Chatas on 5/27/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var hamburgerMenuView: UIView!
    
    @IBOutlet weak var hamburgerFeedView: UIView!
    
    
    var currentViewController: UIViewController!
    
    var menuViewController: MenuViewController!
    
    var feedViewController: FeedViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("feedViewController") as! FeedViewController
        
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
