//
//  ComposeViewController.swift
//  week4-homework-tumblr-2
//
//  Created by Rick James! Chatas on 5/30/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    // outlets
    
    @IBOutlet weak var nevermindButton: UIButton!
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        textButton.center.y = 650
        photoButton.center.y = 650
        quoteButton.center.y = 650
        linkButton.center.y = 650
        chatButton.center.y = 650
        videoButton.center.y = 650
        nevermindButton.center.y = view.bounds.height + nevermindButton.frame.height/2
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear (animated: Bool) {
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.backgroundView.alpha = 0.8
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.nevermindButton.center.y = self.view.bounds.height - self.nevermindButton.frame.height/2
            
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.4, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            self.textButton.center.y = 212
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            self.photoButton.center.y = 212
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            self.quoteButton.center.y = 212
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            self.linkButton.center.y = 332
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.4, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            self.chatButton.center.y = 332
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.4, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
            self.videoButton.center.y = 332
            }) { (Bool) -> Void in
        }
        
    }
    
    override func viewWillDisappear (animated: Bool) {
        
        UIView.animateWithDuration(0.7, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.backgroundView.alpha = 0
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.nevermindButton.center.y = self.view.bounds.height + self.nevermindButton.frame.height/2
            }) { (Bool) -> Void in
        }
        
        
        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.textButton.center.y = -75
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.photoButton.center.y = -75
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.7, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.quoteButton.center.y = -75
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.7, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.linkButton.center.y = -75
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.chatButton.center.y = -75
            }) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.videoButton.center.y = -75
            }) { (Bool) -> Void in
        }
        
    }
}