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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tblDefaultTip.dataSource = self
        self.tblDefaultTip.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellTip")
        let tipPercent = NSUserDefaults.standardUserDefaults().loadTipPercent()
        let tipIndex = TipUtils.getTipIndex(tipPercent)
        
        cell?.textLabel?.text = "\(TipUtils.getTipValue(indexPath.row))%"
        
        if indexPath.row == tipIndex {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell!;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tipPercent = TipUtils.getTipValue(indexPath.row)
        NSUserDefaults.standardUserDefaults().saveTipPercent(tipPercent)
        
        tableView.reloadData()
    }
}

