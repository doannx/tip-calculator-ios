//
//  SettingViewController.swift
//  tippy
//
//  Created by john on 2/3/17.
//  Copyright © 2017 doannx. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblDefaultTip: UITableView!
    @IBOutlet weak var tblTheme: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tblDefaultTip.dataSource = self
        self.tblDefaultTip.delegate = self
        
        self.tblTheme.dataSource = self
        self.tblTheme.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        updateTheme()
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tblDefaultTip {
            return section == 0 ? 3 : 0
        }
        
        if tableView == self.tblTheme {
            return section == 0 ? 2 : 0
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableView == self.tblDefaultTip ? "Default Tip Percent" : "Default Theme"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == self.tblDefaultTip {
            print(indexPath.row)
            print(TipUtils.getTipValue(indexPath.row))
            cell = tableView.dequeueReusableCellWithIdentifier("cellTip")
            let tipPercent = NSUserDefaults.standardUserDefaults().loadTipPercent()
            let tipIndex = TipUtils.getTipIndex(tipPercent)
            
            cell?.textLabel?.text = "\(TipUtils.getTipValue(indexPath.row))%"
            cell?.accessoryType = indexPath.row == tipIndex ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
            
        }
        
        if tableView == self.tblTheme {
            cell = tableView.dequeueReusableCellWithIdentifier("cellTheme")
            let themeId = NSUserDefaults.standardUserDefaults().loadTheme()
            
            cell?.textLabel?.text = "\(ThemeUtils.getThemeName(indexPath.row))"
            cell?.accessoryType = indexPath.row == themeId ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
        }
        
        return cell!;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.tblDefaultTip {
            NSUserDefaults.standardUserDefaults().saveTipPercent(TipUtils.getTipValue(indexPath.row))
        }
        if tableView == self.tblTheme {
            NSUserDefaults.standardUserDefaults().saveSelectedTheme(indexPath.row)
        }
        
        tableView.reloadData()
        updateTheme()
    }
    
    private func updateTheme() {
        let themeId = NSUserDefaults.standardUserDefaults().loadTheme()
    
        let navigationColor: UIColor
        let footerColor: UIColor
        let foreColor: UIColor
        
        if(themeId == 0){
            navigationColor = UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0)
            footerColor = UIColor(red:0.73, green:0.87, blue:0.98, alpha:1.0)
            foreColor = UIColor(red:0.05, green:0.28, blue:0.63, alpha:1.0)
        } else {
            navigationColor = UIColor(red:0.38, green:0.49, blue:0.55, alpha:1.0)
            footerColor = UIColor(red:0.81, green:0.85, blue:0.86, alpha:1.0)
            foreColor = UIColor(red:0.15, green:0.20, blue:0.22, alpha:1.0)
        }
        
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.barTintColor = navigationColor
        
        self.tblTheme.tintColor = foreColor
        self.tblTheme.backgroundColor = footerColor
        
        self.tblDefaultTip.tintColor = foreColor
        self.tblDefaultTip.backgroundColor = footerColor
    }

}

