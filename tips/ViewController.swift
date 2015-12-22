//
//  ViewController.swift
//  tips
//
//  Created by Tina Chen on 12/13/15.
//  Copyright © 2015 tinachen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billArea: UIView!
    @IBOutlet weak var totalArea: UIView!
    @IBOutlet weak var divider: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
        totalArea.alpha = 0
        totalArea.alpha = 0
        divider.alpha = 0
        tipLabel.alpha = 0
        tipControl.alpha = 0
        billArea.transform = CGAffineTransformMakeTranslation(0, 100)
        totalArea.transform = CGAffineTransformMakeTranslation(0, 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if billField.text == "" {
            UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.totalArea.alpha = 0
                self.divider.alpha = 0
                self.tipLabel.alpha = 0
                self.tipControl.alpha = 0
                self.billArea.transform = CGAffineTransformMakeTranslation(0, 100)
                self.totalArea.transform = CGAffineTransformMakeTranslation(0, 100)
            }, completion: nil)
        } else {
            UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.billArea.transform = CGAffineTransformMakeTranslation(0, 0)
                self.totalArea.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
            UIView.animateWithDuration(0.8, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.totalArea.alpha = 1
                self.divider.alpha = 0.25
                self.tipLabel.alpha = 0.8
                self.tipControl.alpha = 0.8
            }, completion: nil)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}