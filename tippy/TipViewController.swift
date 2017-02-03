//
//  TipViewController.swift
//  tippy
//
//  Created by john on 2/3/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    private var DISPLAY_VALUE_PATTERN = "$%.2f"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // setup for GUI
        billField.contentVerticalAlignment = UIControlContentVerticalAlignment.Bottom
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.03, green:0.85, blue:0.56, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.03, green:0.85, blue:0.56, alpha:1.0)
        // set default focus on [billField]
        billField.becomeFirstResponder();
        // set title for segments
        for (index, element) in TipUtils.TIP_PERCENTAGE_VALUES.enumerate() {
            tipControl.setTitle(String(element), forSegmentAtIndex: index)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // load default tip value
        tipControl.selectedSegmentIndex = TipUtils.getTipIndex(NSUserDefaults.standardUserDefaults().loadTipPercent())
        // re-calculate
        calculateAndUpdateGui()
        // animated
        UIView.animateWithDuration(4.0, animations: {
            self.tipControl.center.y = 135
            self.tipLabel.alpha += 1
            self.totalLabel.alpha += 1
        })
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(sender: AnyObject) {
        calculateTip(sender)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        calculateAndUpdateGui()
    }
    
    private func calculateAndUpdateGui(){
        let bill = Double(billField.text!) ?? 0
        let tipPercent = Double(TipUtils.getTipValue(tipControl.selectedSegmentIndex)) * 0.01
        let tip = TipUtils.calculateTipAmount(bill, tipPercent: tipPercent)
        let total = TipUtils.calculateTotalAmount(bill, tipPercent: tipPercent)
        
        tipLabel.text = String(format: DISPLAY_VALUE_PATTERN, tip)
        totalLabel.text = String(format: DISPLAY_VALUE_PATTERN, total)
    }
}

