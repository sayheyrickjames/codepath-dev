//
//  LightboxTransition.swift
//  custom-presentations
//
//  Created by Rick James! Chatas on 6/1/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        containerView.backgroundColor = UIColor(white: 0, alpha: 0)
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            containerView.backgroundColor = UIColor(white: 0, alpha: 0)
            fromViewController.view.transform = CGAffineTransformMakeScale(0.01, 0.01)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
   
}
