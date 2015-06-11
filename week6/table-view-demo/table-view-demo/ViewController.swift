//
//  ViewController.swift
//  table-view-demo
//
//  Created by Rick James! Chatas on 6/8/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Tim", "Court", "Dugan", "Weiss", "Min", "Christine", "Cece", "Jules", "Sara"]
    
    var names = ["Plano, TX", "Ft Wayne, Indiana", "Alden, NY", "Menlo Park, CA", "Wuhan, China", "Palo Alto, CA", "Andover, MA", ]
    
    var movies: [NSDictionary]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us")
        
        var request = NSURLRequest(URL: <#NSURL#>)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    
    var cell = tableView.dequeueReusable
    
    cell.nameLabel.text = names [indexPath.row]
    
    
    
    return cell
    
}

