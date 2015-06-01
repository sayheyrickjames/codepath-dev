//
//  SearchViewController.swift
//  week4-homework-tumblr-2
//
//  Created by Rick James! Chatas on 5/30/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // outlets
    
    @IBOutlet weak var loading1: UIImageView!
    @IBOutlet weak var searchScrollView: UIScrollView!
    @IBOutlet weak var trendingImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchScrollView.contentSize = trendingImageView.image!.size
        
        trendingImageView.hidden = true
        var images = UIImage.animatedImageNamed("loading-", duration: 0.5)
        loading1.image = images
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear (animated: Bool) {
    }
    
    override func viewDidAppear (animated: Bool) {
        
        delay(2, { () -> () in
            self.trendingImageView.hidden = false
            self.loading1.hidden = true
        })
    }
    
    override func viewWillDisappear (animated: Bool) {
    }
    
    override func viewDidDisappear (animated: Bool) {
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
