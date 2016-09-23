//
//  MenuPanelViewController.swift
//  Tapp
//
//  Created by Luis Arias on 07/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

protocol MenuPanelViewControllerDelegate {
    func itemSelected(_ item: String)
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
        
        setTableViewBackgroundGradient(UIColor(red: 15/255, green: 30/255, blue: 30/255, alpha: 1.0), UIColor.black)
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.red
        self.tableView.rowHeight = 70
    }
    
    func setTableViewBackgroundGradient(_ topColor: UIColor, _ bottomColor: UIColor) {
        
        let gradientBackgroundColors = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations = [0.0,1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.tableView.bounds
        let backgroundView = UIView(frame: self.tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        self.tableView.backgroundView = backgroundView
    }
    
}

// MARK: - UITableViewDataSource

extension MenuPanelViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items?.count)!;
    }
    
    @objc(tableView:willDisplayCell:forRowAtIndexPath:) func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.ItemCell, for: indexPath) as! ItemCell
        
        cell.configureCellForItem(items![(indexPath as NSIndexPath).row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
}

extension MenuPanelViewController: UITableViewDelegate {
}
