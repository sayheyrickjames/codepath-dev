//
//  CardsViewController.swift
//  week4-class-tinder
//
//  Created by Rick James! Chatas on 5/24/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var cardImageView: UIImageView!
    
    // var
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        cardInitialCenter = cardImageView.center
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didDragCard(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        // pan began
        if (sender.state == UIGestureRecognizerState.Began){
            
            
        }
        
            // pan changed
        else if (sender.state == UIGestureRecognizerState.Changed) {
            
            
        }
        
            // pan ended
        else if (sender.state == UIGestureRecognizerState.Ended) {
            
            
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
