//
//  TabBarViewController.swift
//  week4-homework-tumblr-2
//
//  Created by Rick James! Chatas on 5/29/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    // outlets
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var explorePopup: UIImageView!
    
    
    // class variables
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    
    var currentViewController: UIViewController!
    var selectedButton: UIButton!
    var explorePopupShowing: Bool!
    
    // functions
    
    func removeChildView (content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // view controller variables for swapping
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")as! SearchViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")as! TrendingViewController
        
        currentViewController = homeViewController
        didPressHomeButton(self)
        
        explorePopup.hidden = false
        
        UIView.animateWithDuration(1.2, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.explorePopup.center.y = 475
            }) { (Bool) -> Void in
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // button actions
    
    @IBAction func didPressHomeButton(sender: AnyObject) {
        removeChildView(currentViewController)
        addChildViewController(homeViewController)
        var homeView = homeViewController.view
        homeView.frame = contentView.frame
        contentView.addSubview(homeView)
        homeViewController.didMoveToParentViewController(self)
        currentViewController = homeViewController
        
        // button states
        homeButton.selected = true
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        explorePopup.hidden = false
    }
    
    
    @IBAction func didPressSearchButton(sender: AnyObject) {
        removeChildView(currentViewController)
        addChildViewController(searchViewController)
        var searchView = searchViewController.view
        searchView.frame = contentView.frame
        contentView.addSubview(searchView)
        homeViewController.didMoveToParentViewController(self)
        currentViewController = searchViewController
        
        // button states
        homeButton.selected = false
        searchButton.selected = true
        accountButton.selected = false
        trendingButton.selected = false
        explorePopup.hidden = true
    }
    
    
    @IBAction func didPressAccountButton(sender: AnyObject) {
        removeChildView(currentViewController)
        addChildViewController(accountViewController)
        var accountView = accountViewController.view
        accountView.frame = contentView.frame
        contentView.addSubview(accountView)
        accountViewController.didMoveToParentViewController(self)
        currentViewController = accountViewController
        
        // button states
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = true
        trendingButton.selected = false
        explorePopup.hidden = false
    }
    
    
    @IBAction func didPressTrendingButton(sender: AnyObject) {
        removeChildView(currentViewController)
        addChildViewController(trendingViewController)
        var trendingView = trendingViewController.view
        trendingView.frame = contentView.frame
        contentView.addSubview(trendingView)
        trendingViewController.didMoveToParentViewController(self)
        currentViewController = trendingViewController
        
        // button states
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = true
        explorePopup.hidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as! UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
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
