//
//  HashtagTableViewController.swift
//  Tapp
//
//  Created by Luis Arias on 21/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagTableViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var hastagTableView: UITableView!
    var hastagList = Hastag.crateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupCustomTableViewBackground()
        customizeNavbar()
        self.searchBar.barStyle = UIBarStyle.Black
        
    }
    
    func setupTableView() -> Void {
        self.hastagTableView.dataSource = self
        self.hastagTableView.delegate = self
        self.hastagTableView.rowHeight = 70
    }
    
    func customizeNavbar(){
        let attributes = [ NSForegroundColorAttributeName: UIColor.whiteColor()]
        let navbar = self.navigationController?.navigationBar
        navbar?.tintColor = UIColor.whiteColor()
        navbar?.barStyle = UIBarStyle.BlackTranslucent
        navbar!.titleTextAttributes = attributes
    }
    
    func setupCustomTableViewBackground() {
        //Create custom view
        let patternView = UIView(frame: self.hastagTableView.frame)
        let image = UIImageView(image: UIImage(named: "background"))
        
        //Create blur view
        let blur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blur)
        
        self.view.bounds = CGRect(x: 0, y: 0, width: self.hastagTableView.frame.size.width, height: self.hastagTableView.frame.size.height)
        
        image.frame = self.view.bounds
        patternView.insertSubview(image, atIndex: 0)
        patternView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        blurView.frame = self.view.bounds
        patternView.insertSubview(blurView, atIndex: 1)
        
        //set backgroundView to tableView
        self.hastagTableView.backgroundView = patternView
    }
    
    private struct Storyboard {
        static let CellIdentifier = "Hastag Cell"
    }
}

extension HashtagTableViewController: UITableViewDelegate {
    
    //MARK: Delegate Methods
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
}

extension HashtagTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hastagList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! HashtagTableViewCell
        
        setDataCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    func setDataCell(cell: HashtagTableViewCell, indexPath: NSIndexPath) {
        let item = hastagList[indexPath.item]
        cell.hashtag = item
    }
}



