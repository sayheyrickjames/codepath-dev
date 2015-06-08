//
//  NewsFeedViewController.swift
//  week5-homework-facebook-photos
//
//  Created by Rick James! Chatas on 6/6/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    // outlets
    
    @IBOutlet weak var NewsFeedScrollView: UIScrollView!
    
    // variables
    
    var selectedImageView: UIImageView!
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NewsFeedScrollView.contentSize = CGSize(width: view.frame.width, height: 1536)
        NewsFeedScrollView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        destinationViewController.bigImage = selectedImageView.image
        
        // take over the transition
        imageTransition = ImageTransition()
        imageTransition.duration = 0.4
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = imageTransition
        
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}
