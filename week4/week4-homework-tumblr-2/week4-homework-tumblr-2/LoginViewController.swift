//
//  LoginViewController.swift
//  week4-homework-tumblr-2
//
//  Created by Rick James! Chatas on 5/31/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // outlets
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // variables
    
    var loginViewCenter: CGPoint!
    var loginViewOriginalCenter: CGPoint!
    var loginViewMovedDownCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // starting points
        
        loginViewOriginalCenter = loginView.center
        loginViewMovedDownCenter = CGPoint(x: loginView.center.x, y: loginView.center.y + 500)
        
        loginView.center = loginViewMovedDownCenter
        backgroundView.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.backgroundView.alpha = 1
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.loginView.center = self.loginViewOriginalCenter
            }, completion: nil)
        
        delay(0.1, { () -> () in
            emailTextField.becomeFirstResponder()
        })
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        view.endEditing(true)
        
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.loginView.center = self.loginViewMovedDownCenter
            }, completion: nil)
        
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
