//
//  ViewController.swift
//  TestConstraintAnimation
//
//  Created by Zion Perez on 3/29/17.
//  Copyright © 2017 Zion Perez. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    // Hello World UITextField and TextField Border vars
    @IBOutlet weak var helloWorldTextField: UITextField!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var borderTextFieldWidth: NSLayoutConstraint!
    
    // Hello Label Vars
    @IBOutlet weak var helloLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var helloLabel: UILabel!
    
    // Button Vars
    @IBOutlet weak var myButton: UIButton!
    var grow: Bool = false
    
    func animateGrowShrinkTextFields(grow: Bool, duration: TimeInterval) {
        if grow {
            UIView.animate(withDuration: duration, animations: {
                self.borderTextFieldWidth.constant = 330
                // self.widthConstraint.constant = 330
                // self.helloLabelWidthConstraint.constant = 330
                // self.helloWorldTextField.textAlignment = NSTextAlignment.center
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                print("Grow animation complete!")
            })
        } else {
            UIView.animate(withDuration: duration, animations: {
                self.borderTextFieldWidth.constant = 115
                // self.widthConstraint.constant = 100
                // self.helloLabelWidthConstraint.constant = 100
                // self.helloWorldTextField.textAlignment = NSTextAlignment.center
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                print("Shrink animation complete!")
            })
        }
    }
    
    func increaseFontSize(duration: TimeInterval) {
        // helloLabel.font = UIFont.boldSystemFont(ofSize: 35)
        // helloLabel.transform = helloLabel.transform.scaledBy(x: 1.0, y: 1.0)
        UIView.animate(withDuration: duration, animations: {
            self.helloLabel.transform = self.helloLabel.transform.scaledBy(x: 5.0, y: 5.0)
        })
    }
    
    func decreaseFontSize(duration: TimeInterval) {
        // helloLabel.font = UIFont.boldSystemFont(ofSize: 35)
        // helloLabel.transform = helloLabel.transform.scaledBy(x: 1.0, y: 1.0)
        UIView.animate(withDuration: duration, animations: {
            self.helloLabel.transform = self.helloLabel.transform.scaledBy(x: 0.2, y: 0.2)
        })
    }
    
    @IBAction func toggle(){
        let duration: TimeInterval = 1.0
        grow = !grow
        if grow {
            myButton.setTitle("Shrink", for: UIControlState.normal)
            increaseFontSize(duration: duration)
        } else {
            myButton.setTitle("Grow", for: UIControlState.normal)
            decreaseFontSize(duration: duration)
        }
        animateGrowShrinkTextFields(grow: grow, duration: duration)
    }
}

