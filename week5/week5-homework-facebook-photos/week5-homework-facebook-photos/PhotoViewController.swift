//
//  PhotoViewController.swift
//  week5-homework-facebook-photos
//
//  Created by Rick James! Chatas on 6/6/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    // outlets
    
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var bigImageContainer: UIImageView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var photoActions: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    
    // variables
    
    var bigImage: UIImage!
    var bigImageStartingY: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        bigImageContainer.image = bigImage
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        
        
        var translation = sender.translationInView(view)
        
        if (sender.state == UIGestureRecognizerState.Began){
            println("panning began")
            bigImageStartingY = bigImageContainer.center.y
        }
            
        else if (sender.state == UIGestureRecognizerState.Changed) {
            
            bigImageContainer.center.y = bigImageStartingY + translation.y
            //			println(self.bigImageContainer.center.y)
            blackView.alpha = 1 - (abs(translation.y)/100)
            doneButton.alpha = 0
            photoActions.alpha = 0
            println(self.photoScrollView.alpha)
            
            
        }
            
        else if (sender.state == UIGestureRecognizerState.Ended) {
            
            if abs(translation.y) > 60 {
                dismissViewControllerAnimated(true, completion: nil)
            }
            else {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.bigImageContainer.center.y = self.bigImageStartingY
                    self.blackView.alpha = 1
                    self.doneButton.alpha = 1
                    self.photoActions.alpha = 1
                })
            }
            
        }
    }
    
    @IBAction func didPressDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
