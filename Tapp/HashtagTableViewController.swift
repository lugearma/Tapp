//
//  HashtagTableViewController.swift
//  Tapp
//
//  Created by Luis Arias on 21/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagTableViewController: UIViewController, UITableViewDelegate {
    
    let hastagList: HastagList = HastagList()
    @IBOutlet var hastagTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Was Loaded")
        setupTableView()
    }
    
    func setupTableView() -> Void{
        self.hastagTableView.dataSource = hastagList
        self.hastagTableView.delegate = self
    }
}
