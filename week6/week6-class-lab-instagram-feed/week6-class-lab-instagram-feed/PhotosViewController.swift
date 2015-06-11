//
//  PhotosViewController.swift
//  week6-class-lab-instagram-feed
//
//  Created by Rick James! Chatas on 6/10/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var photos: NSArray! = []
    
    // outlets
    
    @IBOutlet weak var tableView: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var clientId = "e1e41c9a6374432fa0edb691b66bbdfa"
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.photos = responseDictionary["data"] as! NSArray
            self.tableView.reloadData()
            
            println("response: \(self.photos)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell") as! PhotoCell
        
        var photo = photos[indexPath.row] as! NSDictionary
        cell.usernameLabel!.text = photo.valueForKeyPath("user.username") as? String
        
        return cell
    }
    
    

    /*
    // MARK: - 
    Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
