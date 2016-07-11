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
    
    struct TableView {
        struct CellIdentifiers {
            static let ItemCell = "ItemCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        self.setupTableView()
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.redColor()
        self.tableView.rowHeight = 70
    }
    
}

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
