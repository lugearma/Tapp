//
//  HashtagTableViewController.swift
//  Tapp
//
//  Created by Luis Arias on 21/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagTableViewController: UITableViewController {
    
    let hastagList: HastagList = HastagList()
    @IBOutlet var hastagTableView: UITableView!
    let pinkColor = UIColor(red: (253/255), green: (105.0/255), blue: (154.0/255), alpha: 1.0)
    let purpleColor = UIColor(red: (103/255), green: (108/255), blue: (251/255), alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setTableViewBackgroundGradient(self, pinkColor, purpleColor)
    }
    
    func setupTableView() -> Void{
        self.hastagTableView.dataSource = hastagList
        self.hastagTableView.delegate = self
    }
    
    func setTableViewBackgroundGradient(sender: UITableViewController, _ topColor:UIColor, _ bottomColor:UIColor) {
        
        let gradientBackgroundColors = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations = [0.0,1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = sender.tableView.bounds
        let backgroundView = UIView(frame: sender.tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, atIndex: 0)
        sender.tableView.backgroundView = backgroundView
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
}
