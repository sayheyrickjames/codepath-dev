//
//  MailboxViewController.swift
//  week3-homework-mailbox
//
//  Created by Rick James! Chatas on 5/24/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate, UIAlertViewDelegate {
    
    // all outlets
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    
    // messageContainerView for bg color
    @IBOutlet weak var messageContainerView: UIView!
    
    // messageImageView is the message image that's sliding
    @IBOutlet weak var messageImageView: UIImageView!
    
    // all variables
    
    // starting center points
    var originalMessageCenter: CGPoint!
    var originalLaterIconCenter: CGPoint!
    var originalArchiveIconCenter:CGPoint!
    var originalDeleteIconCenter: CGPoint!
    var originalFeedCenter: CGPoint!
    var gutter: CGFloat!
    var originalContainerViewCenterX: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Scroll View
        scrollView.frame.size = view.bounds.size
        scrollView.contentSize = CGSize(width: 320, height: 1432)
        //		messageContainerView.backgroundColor = UIColor.grayColor()
        originalMessageCenter = messageImageView.center
        
        //initial values
        listIcon.alpha = 0
        deleteIcon.alpha = 0
        
        originalLaterIconCenter = CGPoint(x: messageImageView.frame.width - 30, y: messageImageView.frame.height/2)
        originalArchiveIconCenter = CGPoint(x: 30, y: messageImageView.frame.height/2)
        originalFeedCenter = feedImageView.center
        
        gutter = 30
        rescheduleImageView.alpha = 0
        rescheduleImageView.center = view.center
        
        listImageView.alpha = 0
        listImageView.center = view.center
        
        originalContainerViewCenterX = 160
        
        // println("\(originalFeedCenter.y)")
        // println("\(messageImageView.center.x)")
        // println("\(laterIcon.center.x)")
        // println("\(messageImageView.frame.width)")
        
        
        
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
    
    // PAN GESTURE RECOGNIZER
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        var edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        edgeGesture.edges = UIRectEdge.Left
        containerView.addGestureRecognizer(edgeGesture)
        
        
        // PAN BEGAN
        if (sender.state == UIGestureRecognizerState.Began){
            //set the starting point of the message to its current position
            originalMessageCenter = messageImageView.center
            
            
            archiveIcon.alpha = 0
            deleteIcon.alpha = 0
            listIcon.alpha = 0
            laterIcon.alpha = 0
            
            
            
        }
            // PAN CHANGED
        else if (sender.state == UIGestureRecognizerState.Changed) {
            // as the message is dragged, make the center it's most recent position plus the horizontal difference you drag
            messageImageView.center = CGPointMake(originalMessageCenter.x + translation.x, originalMessageCenter.y)
            
            
            // short swipe left for later
            if (messageImageView.center.x < 100 && messageImageView.center.x > -40) {
                messageContainerView.backgroundColor = UIColor(red: 255/255, green: 211/255, blue: 32/255, alpha: 1)
                deleteIcon.alpha = 0
                listIcon.alpha = 0
                laterIcon.alpha = 1
                laterIcon.center = CGPointMake(messageImageView.frame.width + gutter + translation.x, messageImageView.center.y)
                //println("\(laterIcon.center)")
                
                
            }
                // long swipe left for list
            else if (messageImageView.center.x <= -40) {
                messageContainerView.backgroundColor = UIColor(red: 216/255, green: 166/255, blue: 117/255, alpha: 1)
                deleteIcon.alpha = 0
                laterIcon.alpha = 0
                listIcon.alpha = 1
                listIcon.center = CGPointMake(messageImageView.frame.width + gutter + translation.x, messageImageView.center.y)
                
                
            }
                // short swipe right to archive
            else if (messageImageView.center.x > 220 && messageImageView.center.x < 360) {
                messageContainerView.backgroundColor = UIColor(red: 98/255, green: 216/255, blue: 98/255, alpha: 1)
                laterIcon.alpha = 0
                deleteIcon.alpha = 0
                archiveIcon.alpha = 1
                archiveIcon.center = CGPointMake(translation.x - gutter, messageImageView.center.y)
                
                
            }
                // long swipe right to delete
            else if (messageImageView.center.x >= 360) {
                messageContainerView.backgroundColor = UIColor(red: 239/255, green: 84/255, blue: 12/255, alpha: 1)
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                deleteIcon.center = CGPointMake(translation.x - gutter, messageImageView.center.y)
            }
                
                
                // otherwise keep the background gray
            else {
                
                // ??? Use velocity here to change opacity?
                
                
                
                laterIcon.alpha = -translation.x / 60
                archiveIcon.alpha = translation.x / 60
                
                
                messageContainerView.backgroundColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1)
                laterIcon.center = CGPointMake(originalLaterIconCenter.x, originalLaterIconCenter.y)
                archiveIcon.center = originalArchiveIconCenter
                
            }
            
            
        }
            // PAN ENDED
        else if (sender.state == UIGestureRecognizerState.Ended) {
            // later
            if (messageImageView.center.x < 100 && messageImageView.center.x > -40){
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageImageView.center.x = -self.view.frame.width
                    self.laterIcon.center.x = self.messageImageView.center.x + self.messageImageView.frame.width/2 + self.gutter
                    self.rescheduleImageView.alpha = 1
                    
                })
                
            }
                
                // list
            else if (messageImageView.center.x <= -40) {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageImageView.center.x = -self.view.frame.width
                    self.listIcon.center.x = self.messageImageView.center.x + self.messageImageView.frame.width/2 + self.gutter
                    self.listImageView.alpha = 1
                    
                })
                
            }
                
                // archive
            else if (messageImageView.center.x > 220 && messageImageView.center.x < 360) {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageImageView.center.x = self.view.frame.width * 2
                    self.archiveIcon.center.x = self.messageImageView.center.x - self.gutter
                    
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.feedImageView.center.y = self.feedImageView.center.y - self.messageImageView.frame.height
                            
                        })
                        
                })
                
                
                
                
            }
                // delete
            else if (messageImageView.center.x >= 360) {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageImageView.center.x = self.view.frame.width * 2
                    self.deleteIcon.center.x = self.messageImageView.center.x - self.gutter
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.feedImageView.center.y = self.feedImageView.center.y - self.messageImageView.frame.height
                            
                        })
                        
                })
            }
                
                // didn't swipe far enough, return to original position
            else {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.messageImageView.center.x = self.view.frame.width/2
                })
            }
        }
        
        
    }
    @IBAction func didTapReschedulePane(sender: UITapGestureRecognizer) {
        println("tap")
        self.archiveIcon.alpha = 0
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.rescheduleImageView.alpha = 0
            self.messageImageView.center.x = self.view.frame.width/2
            self.laterIcon.center.x = self.messageImageView.center.x + self.messageImageView.frame.width/2 + self.gutter
        })
        
        
    }
    
    @IBAction func didTapListPane(sender: UITapGestureRecognizer) {
        self.archiveIcon.alpha = 0
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.listImageView.alpha = 0
            self.messageImageView.center.x = self.view.frame.width/2
            self.listIcon.center.x = self.messageImageView.center.x + self.messageImageView.frame.width/2 + self.gutter
            
            
        })
    }
    
    @IBAction func didPressResetButton(sender: AnyObject) {
        messageImageView.center.x = view.frame.width/2
        feedImageView.center = originalFeedCenter
    }
    
    @IBAction func didPressMenuButton(sender: AnyObject) {
        if (containerView.center.x == view.frame.width/2) {
            
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.containerView.center.x += 280
            })
            
        }
        else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.containerView.center.x = self.view.frame.width/2
                
            })
        }
        
        
    }
    
    
    // EDGE PAN WHEN GESTURE RECOGNIZER WAS ADDED PROGRAMATICALLY
    
    func onEdgePan(sender:UIScreenEdgePanGestureRecognizer) {
        var translation = sender.translationInView(view)
        //		var location = sender.locationInView(view)
        //		println("edge pan")
        
        if (sender.state == UIGestureRecognizerState.Began){
            //			println("edge pan began")
            
            originalContainerViewCenterX = containerView.center.x
            
            //			if (self.containerView.center.x <= 160) {
            //			self.containerView.center = CGPointMake(self.containerView.center.x + translation.x, self.containerView.center.y)
            //			}
        }
        else if (sender.state == UIGestureRecognizerState.Changed) {
            //			println("edge pan changed")
            containerView.center.x = originalContainerViewCenterX + translation.x
        }
            
        else if (sender.state == UIGestureRecognizerState.Ended) {
            //			println("edge pan ended")
            if (translation.x < 100) {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: nil, animations: { () -> Void in
                    self.containerView.center.x = 160
                    }, completion: { (Bool) -> Void in
                        //
                })
            } else if (translation.x >= 100) {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: nil, animations: { () -> Void in
                    self.containerView.center.x = 440
                    }, completion: { (Bool) -> Void in
                        //
                })
                
            }
            
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
