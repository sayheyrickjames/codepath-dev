//
//  CanvasViewController.swift
//  week3-class1-canvas
//
//  Created by Rick James! Chatas on 5/18/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    @IBOutlet weak var mrCleanImageView: UIImageView!
    
    @IBOutlet weak var totoroImageView: UIImageView!
    
    @IBAction func onTotoroTap(sender: AnyObject) {
        println("come visit, mr. clean")
        
        mrCleanImageView.alpha = 0
        self.mrCleanImageView.center.y = 50
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.mrCleanImageView.alpha = 1
            self.mrCleanImageView.center.y = 330
            }) { (Bool) -> Void in
                
                UIView.animateWithDuration(<#duration: NSTimeInterval#>, delay: <#NSTimeInterval#>, options: <#UIViewAnimationOptions#>, animations: <#() -> Void##() -> Void#>, completion: <#((Bool) -> Void)?##(Bool) -> Void#>)
                
        }
        
UIView.    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
}
