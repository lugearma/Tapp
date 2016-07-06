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
    var hashtagList = Hastag.crateData()
    var hashtagListFilteredData: [Hastag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.hashtagListFilteredData = self.hashtagList
        
        setupTableView()
        setupCustomTableViewBackground()
        customizeNavbar()
        setupSearchBar()
        addButtonToCreateNewHashtag()
        self.searchBar.barStyle = UIBarStyle.Black
    }
    
    func addButtonToCreateNewHashtag () {
        
    }
    
    func setupTableView() -> Void {
        self.hastagTableView.dataSource = self
        self.hastagTableView.delegate = self
        self.hastagTableView.rowHeight = 70
        self.hastagTableView.separatorStyle = .None
    }
    
    func setupSearchBar() {
        self.searchBar.delegate = self
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.SegueHashtagDetailIdentifier{
            let hashtagDetailView = segue.destinationViewController as! HashtagDetailViewController
            let indexPath = self.hastagTableView.indexPathForSelectedRow
            let hashtagTitle = self.hashtagList[(indexPath?.item)!].hastagTitle
            
            hashtagDetailView.navbarTitle = hashtagTitle!
        }
    }
    
    private struct Storyboard {
        static let CellIdentifier = "Hastag Cell"
        static let SegueHashtagDetailIdentifier = "HashtagDetail"
    }
}


//MARK: Table View Delegate Methods
extension HashtagTableViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        customSelectedCell(cell)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Storyboard.SegueHashtagDetailIdentifier, sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func customSelectedCell(cell: UITableViewCell) {
        let selectedBackgroundView = UIView(frame: cell.frame)
        selectedBackgroundView.backgroundColor = UIColor(red: (46/255), green: (46/255), blue: (46/255), alpha: 0.5)
        cell.selectedBackgroundView = selectedBackgroundView
    }
}

// Table View Data Sourche Methods
extension HashtagTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hashtagListFilteredData.isEmpty{
            print("Esta vacia")
        }
        return self.hashtagListFilteredData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! HashtagTableViewCell
        
        setDataCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    func setDataCell(cell: HashtagTableViewCell, indexPath: NSIndexPath) {
        let item = self.hashtagListFilteredData[indexPath.item]
        cell.hashtag = item
    }
}

// MARK: Search Bar Delegate Methods
extension HashtagTableViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.hashtagListFilteredData = self.hashtagList
        } else {
            self.hashtagListFilteredData = self.hashtagList.filter({
                (data: Hastag) -> Bool in
                let title = data.hastagTitle
                if title?.rangeOfString(searchText) != nil {
                    return true
                }
                return false
            })
        }
        self.hastagTableView.reloadData()
    }
}














