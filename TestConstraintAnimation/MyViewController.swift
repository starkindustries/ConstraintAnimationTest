//
//  ViewController.swift
//  TestConstraintAnimation
//
//  Created by Zion Perez on 3/29/17.
//  Copyright © 2017 Zion Perez. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    // Hello World UITextField vars
    @IBOutlet weak var helloWorldTextField: UITextField!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    // Hello Label Vars
    @IBOutlet weak var helloLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var helloLabel: UILabel!
    
    // Button Vars
    @IBOutlet weak var myButton: UIButton!
    var grow: Bool = false
    
    func animateGrowShrinkTextFields(grow: Bool) {
        let duration: TimeInterval = 0.5
        if grow {
            UIView.animate(withDuration: duration, animations: {
                self.widthConstraint.constant = 330
                self.helloLabelWidthConstraint.constant = 330
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                print("Grow animation complete!")
            })
        } else {
            UIView.animate(withDuration: duration, animations: {
                self.widthConstraint.constant = 100
                self.helloLabelWidthConstraint.constant = 100
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                print("Shrink animation complete!")
            })
        }
    }
    
    @IBAction func toggle(){
        grow = !grow
        if grow {
            myButton.setTitle("Shrink", for: UIControlState.normal)
        } else {
            myButton.setTitle("Grow", for: UIControlState.normal)
        }
        animateGrowShrinkTextFields(grow: grow)
    }
}

