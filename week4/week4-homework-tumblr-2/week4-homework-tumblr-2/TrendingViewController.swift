//
//  TrendingViewController.swift
//  week4-homework-tumblr-2
//
//  Created by Rick James! Chatas on 5/25/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var trendingScrollView: UIScrollView!
    @IBOutlet weak var trendingImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        trendingScrollView.contentSize = trendingImageView.image!.size
        
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
