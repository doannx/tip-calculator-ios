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
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewFooter: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // setup for GUI
        updateTheme()
        // set default focus on [billField]
        billField.becomeFirstResponder();
        // set currency symbol on [billField]
        billField.placeholder = TipUtils.getCurrencySymbol()
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
        // load bill amount of last time
        billField.text = NSUserDefaults.standardUserDefaults().loadBillAmount()
        // re-calculate
        calculateAndUpdateGui()

        // animated
        UIView.animateWithDuration(5.0, animations: {
            self.tipControl.center.y = 135
            self.tipLabel.alpha += 1
            self.totalLabel.alpha += 1
            // update theme
            self.updateTheme()
        })
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSUserDefaults.standardUserDefaults().saveBillAmount(billField.text!)
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
    
    private func calculateAndUpdateGui() {
        let bill = Double(billField.text!) ?? 0
        let tipPercent = Double(TipUtils.getTipValue(tipControl.selectedSegmentIndex)) * 0.01
        tipLabel.text = TipUtils.formatCurrencyByLocalization(TipUtils.calculateTipAmount(bill, tipPercent: tipPercent))
        totalLabel.text = TipUtils.formatCurrencyByLocalization(TipUtils.calculateTotalAmount(bill, tipPercent: tipPercent))
    }
    
    private func updateTheme() {
        let themeId = NSUserDefaults.standardUserDefaults().loadTheme()
        
        let headerColor: UIColor
        let navigationColor: UIColor
        let footerColor: UIColor
        let foreColor: UIColor
        
        if(themeId == 0){
            headerColor = UIColor(red:0.89, green:0.95, blue:0.99, alpha:1.0)
            navigationColor = UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0)
            footerColor = UIColor(red:0.73, green:0.87, blue:0.98, alpha:1.0)
            foreColor = UIColor(red:0.05, green:0.28, blue:0.63, alpha:1.0)
        } else {
            headerColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
            navigationColor = UIColor(red:0.38, green:0.49, blue:0.55, alpha:1.0)
            footerColor = UIColor(red:0.81, green:0.85, blue:0.86, alpha:1.0)
            foreColor = UIColor(red:0.15, green:0.20, blue:0.22, alpha:1.0)
        }
        
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.barTintColor = navigationColor
        
        self.viewHeader.backgroundColor = headerColor
        self.billField.backgroundColor = headerColor
        self.viewFooter.backgroundColor = footerColor
        
        self.tipLabel.textColor = foreColor
        self.totalLabel.textColor = foreColor
        self.billField.textColor = foreColor
        self.tipControl.tintColor = foreColor
    }
}

