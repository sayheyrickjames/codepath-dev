//
//  ThrillistDetailsViewController.swift
//  week1-class2-lab-facebook
//
//  Created by Rick James! Chatas on 5/6/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class ThrillistDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(sender: AnyObject) {
        
        navigationController!.popViewControllerAnimated(true)
        
    }
    @IBOutlet weak var likeButton: UIButton!

    @IBAction func didPressButton(sender: AnyObject) {
    
        likeButton.selected = !likeButton.selected
    
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
