//
//  MenuPanelViewController.swift
//  Tapp
//
//  Created by Luis Arias on 07/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

protocol MenuPanelViewControllerDelegate {
    func itemSelected(item: String)
}

class MenuPanelViewController: UIViewController {
    
    var items: [MenuItem]?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundProfileImage: UIImageView!
    
    struct TableView {
        struct CellIdentifiers {
            static let ItemCell = "ItemCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        self.setupTableView()
        
        setTableViewBackgroundGradient(UIColor(red: 15/255, green: 30/255, blue: 30/255, alpha: 1.0), UIColor.blackColor())
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.redColor()
        self.tableView.rowHeight = 70
    }
    
    func setTableViewBackgroundGradient(topColor: UIColor, _ bottomColor: UIColor) {
        
        let gradientBackgroundColors = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations = [0.0,1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = self.tableView.bounds
        let backgroundView = UIView(frame: self.tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, atIndex: 0)
        self.tableView.backgroundView = backgroundView
    }
    
}

// MARK: - UITableViewDataSource

extension MenuPanelViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items?.count)!;
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.ItemCell, forIndexPath: indexPath) as! ItemCell
        
        cell.configureCellForItem(items![indexPath.row])
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
}

extension MenuPanelViewController: UITableViewDelegate {
}
