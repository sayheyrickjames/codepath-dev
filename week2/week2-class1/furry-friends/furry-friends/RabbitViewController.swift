//
//  RabbitViewController.swift
//  furry-friends
//
//  Created by Rick James! Chatas on 5/11/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class RabbitViewController: UIViewController {

    @IBOutlet weak var rabbitView: UIImageView!
    @IBOutlet weak var rabbitLabel: UILabel!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!

    var scale = CGFloat(1.0)
    var rotation =
    var initialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialCenter = rabbitView.center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressUpButton(sender: AnyObject) {
        rabbitView.center.y = rabbitView.center.y
    }

    @IBAction func didPressShrinkButton(sender: AnyObject) {
        
        
    }
    
    @IBAction func didPressGrowButton(sender: AnyObject) {
    }
    
    
    @IBAction func onResetButton(sender: AnyObject) {
        rabbitView.center = initialCenter
    }
    
    
    @IBAction func didPressRotateRight(sender: AnyObject) {
        var rotation += CGFloat(-10 * M_PI / 180.0)
        
        self.rabbitView.transform = CGAffineTransformMakeRotation(-10)
    }
    
    @IBAction func didPressRotateLeft(sender: AnyObject) {
       var rotation -= CGFloat(-10 * M_PI / 180.0)
        
        self.rabbitView.transform = CGAffineTransformMakeRotation(-10)
    }
    
    
    @IBAction func didPressSendButton(sender: AnyObject) {
       
        rabbitLabel.text = ""
        loadingView.startAnimating()
        
        delay(0.4, { () -> () in
        if messageField.text == "Hello" {
            rabbitLabel.text = "Sup"
        } else if messageField = "Rebecca"
        else {
            rabbitLabel.text = "Huh? I don't get it..."
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
