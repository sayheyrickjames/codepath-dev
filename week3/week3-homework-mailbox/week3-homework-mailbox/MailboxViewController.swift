//
//  MailboxViewController.swift
//  week3-homework-mailbox
//
//  Created by Rick James! Chatas on 5/20/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    
    // scrollView
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    
    // modal
    @IBOutlet weak var rescheduleImageView: UIImageView!
    
    // what you'd use to add to a list
    
    @IBOutlet weak var listImageView: UIImageView!
    
    // the message area that has the tap gestures
    
    @IBOutlet weak var messageContainerView: UIView!
    
    // this is the message image
    
    @IBOutlet weak var messageView: UIImageView!
    
    // messageView icons
    
    @IBOutlet weak var laterIcon: UIImageView!
    
    @IBOutlet weak var listIcon: UIImageView!
    
    @IBOutlet weak var deleteIcon: UIImageView!
    
    @IBOutlet weak var archiveIcon: UIImageView!
    
    // variable set
    
    var originalMessageCenter: CGPoint!
    var originalFeedCenter: CGPoint!
    var originalLaterIconCenter: CGPoint!
    var originalListIconCenter: CGPoint!
    var originalDeleteIconCenter: CGPoint!
    var originalArchiveIconCenter: CGPoint!
    var originalContainerViewCenterX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 320, height: 1432)
        
        originalMessageCenter = messageView.center
        
        listIcon.alpha = 0
        deleteIcon.alpha = 0
        
        originalLaterIconCenter = CGPoint(x: messageView.frame.width - 30, y: messageView.frame.height/2)
        originalArchiveIconCenter = CGPoint(x: 30, y: messageView.frame.height/2)
        
        originalFeedCenter = feedImageView.center
    
        rescheduleImageView.alpha = 0
        rescheduleImageView.center = view.center
        
        listImageView.alpha = 0
        listImageView.center = view.center
        
        originalContainerViewCenterX = 160
    
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
    
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if (sender.state == UIGestureRecognizerState.Began) {
            
            originalMessageCenter = messageView.center
            
            laterIcon.alpha = 0
            listIcon.alpha = 0
            deleteIcon.alpha = 0
            archiveIcon.alpha = 0
        }
            
        else if (sender.state == UIGestureRecognizerState.Changed) {
            
            messageView.center = CGPointMake(originalMessageCenter.x + translation.x, originalMessageCenter.y)
            
            if (messageView.center.x < 100 && messageView.center.x > -40) {
                messageContainerView.backgroundColor = UIColor(red: 255/255, green: 211/255, blue: 32/255, alpha: 1)
                deleteIcon.alpha = 0
                listIcon.alpha = 0
                laterIcon.alpha = 1
                laterIcon.center = CGPointMake(messageView.frame.width + translation.x, messageView.center.y)
                
            }
            else if (messageView.center.x <= -40) {
                messageContainerView.backgroundColor = UIColor(red: 216/255, green: 166/255, blue: 117/255, alpha: 1)
                deleteIcon.alpha = 0
                laterIcon.alpha = 0
                listIcon.alpha = 1
                listIcon.center = CGPointMake(messageView.frame.width + translation.x, messageView.center.y)
            }
            else if (messageView.center.x > 220 && messageView.center.x < 360) {
                messageContainerView.backgroundColor = UIColor(red: 98/255, green: 216/255, blue: 98/255, alpha: 1)
                laterIcon.alpha = 0
                deleteIcon.alpha = 0
                archiveIcon.alpha = 1
                archiveIcon.center = CGPointMake(translation.x, messageView.center.y)
            }
            else if (messageView.center.x >= 360) {
                messageContainerView.backgroundColor = UIColor(red: 239/255, green: 84/255, blue: 12/255, alpha: 1)
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                deleteIcon.center = CGPointMake(translation.x, messageView.center.y)
            }
            else {
                
                laterIcon.alpha = -translation.x / 60
                archiveIcon.alpha = translation.x / 60
                
                
                messageContainerView.backgroundColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1)
                laterIcon.center = CGPointMake(originalLaterIconCenter.x, originalLaterIconCenter.y)
                archiveIcon.center = originalArchiveIconCenter
                
            }
            
            
        }
        
    }
}