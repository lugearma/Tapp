//
//  HashtagCollectionViewCell.swift
//  Tapp
//
//  Created by Luis Arias on 22/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var hashtagTitleLabel: UILabel!
    @IBOutlet weak var hashtagImage: UIImageView!
    @IBOutlet weak var numberOfTappsLabel: UILabel!
    
    var hashtag: Hastag! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI(){
        self.hashtagTitleLabel.text = self.hashtag.hastagTitle
        self.numberOfTappsLabel.text = String(self.hashtag.tappsNumber)
        //This should be change, when image comes to server
        self.hashtagImage.image = UIImage(named: self.hashtag.urlImage!)
    }

}
