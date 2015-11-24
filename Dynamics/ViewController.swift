//
//  ViewController.swift
//  Dynamics
//
//  Created by Stanley Yang on 11/23/15.
//  Copyright © 2015 Stanley Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {

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
        
        collision = UICollisionBehavior(items: [square])
        
        // Set the view controller as the delegate after the collision object
        collision.collisionDelegate = self
        
        func collisionBehavior(behavior: UICollisionBehavior!, beganContactFormItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
            print("Boundary contact occurred = \(identifier)")
            let collidingView = item as! UIView
            collidingView.backgroundColor = UIColor.yellowColor()
            UIView.animateWithDuration(0.3) {
                collidingView.backgroundColor = UIColor.grayColor()
            }
        }
        
        // Add an invisible boundary that has the same frame as the barrier view. The boundary is visible to the dynamics engine but not the user
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        
        // action property where a block can be executed with every step of the animation
        collision.action = {
            print("\(NSStringFromCGAffineTransform(square.transform)) \(NSStringFromCGPoint(square.center))")
        }
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

