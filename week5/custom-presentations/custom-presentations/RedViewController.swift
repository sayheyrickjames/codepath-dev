//
//  RedViewController.swift
//  custom-presentations
//
//  Created by Rick James! Chatas on 6/1/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    var lightboxtransition : LightboxTransition
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPinch(sender: AnyObject) {
        var location = sender.locationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            performSegueWithIdentifier(modalBlue, sender: nil)
            
        } else if sender.state == UIGestureRecognizerState.Ended{
            if sender.velocity > 0 {
                LightboxTransition.finish()
                
            } else {
                LightboxTransition.cancel()
                dismissViewControllerAnimated(false, completion: nil)
            }
        }
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var fromViewController = segue.sourceViewController as!UIViewController
        var toViewController = segue.destinationViewController as! UIViewController
        var identifier = segue.identifier
        
        toViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        lightboxTransition = LightboxTransition()
        lightboxTransition.duration = 2
        lightboxtransition
    }
    
}