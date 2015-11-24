//
//  ViewController.swift
//  Dynamics
//
//  Created by Stanley Yang on 11/23/15.
//  Copyright © 2015 Stanley Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
         * Creating the first grey square
         */
        
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        /* 
         * Add an immovable barrier
         */
        
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.blueColor()
        view.addSubview(barrier)
        
        /*
         * add gravity
         */
        animator = UIDynamicAnimator(referenceView: view) // UIKit physics engine. This class keeps track of the various behaviours that you add to the engine, such as gravity and provides overall context.
        gravity = UIGravityBehavior(items: [square]) // models the behavior of gravity and exerts forces on one or more items, allowing you to model interactions
        animator.addBehavior(gravity)
        
        /* 
         * Add collision
         */
        
        collision = UICollisionBehavior(items: [square, barrier])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

