//
//  HastagList.swift
//  Tapp
//
//  Created by Luis Arias on 20/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HastagList: NSObject {
    
    var hastagList: [Hastag] = [Hastag(hastagTitle: "#FelizDiaDelPadre", tappsNumber: 234), Hastag( hastagTitle: "#SoyViejoCuando", tappsNumber: 567), Hastag(hastagTitle:  "#MiNoviaMeOdiaSi", tappsNumber: 564)]
    
    private struct Storyboard {
        static let CellIdentifier = "Hastag Cell"
    }
}

extension HastagList: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hastagList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Later change this line for custom cell
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! HashtagTableViewCell
        
        setDataCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    func setDataCell(cell: HashtagTableViewCell, indexPath: NSIndexPath){
        let item = hastagList[indexPath.item]
        cell.hashtag = item
    }
}
