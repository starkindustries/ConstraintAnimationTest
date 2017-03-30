//
//  ViewController.swift
//  TestConstraintAnimation
//
//  Created by Zion Perez on 3/29/17.
//  Copyright © 2017 Zion Perez. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    // Hello World TextField Border var
    @IBOutlet weak var borderTextFieldWidth: NSLayoutConstraint!
    
    // Button Vars
    @IBOutlet weak var myButton: UIButton!
    var grow: Bool = false
    
    func animateGrowShrinkTextFields(grow: Bool, duration: TimeInterval) {
        if grow {
            UIView.animate(withDuration: duration, animations: {
                self.borderTextFieldWidth.constant = 330
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                print("Grow animation complete!")
            })
        } else {
            UIView.animate(withDuration: duration, animations: {
                self.borderTextFieldWidth.constant = 115
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                print("Shrink animation complete!")
            })
        }
    }
    
    @IBAction func toggle(){
        let duration: TimeInterval = 1.0
        grow = !grow
        let title = grow ? "Shrink" : "Grow"
        myButton.setTitle(title, for: UIControlState.normal)
        animateGrowShrinkTextFields(grow: grow, duration: duration)
    }
}

