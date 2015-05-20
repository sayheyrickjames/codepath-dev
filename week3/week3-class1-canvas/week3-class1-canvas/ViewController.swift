//
//  ViewController.swift
//  week3-class1-canvas
//
//  Created by Rick James! Chatas on 5/18/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

var location = sender.locationInView(view)
var translation = sender.translationInView(view)
var velocity = sender.velocityInView(view)

var scale = sender.scale