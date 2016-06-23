//
//  HashtagTableViewCell.swift
//  Tapp
//
//  Created by Luis Arias on 22/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagTableViewCell: UITableViewCell{
    
    @IBOutlet weak var hashtagTitleLabel: UILabel!
    @IBOutlet weak var numberOfTappsLabel: UILabel!
    
    var hashtag: Hastag! {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        self.hashtagTitleLabel.text = hashtag.hastagTitle
        self.numberOfTappsLabel.text = String(hashtag.tappsNumber)
    }
}
