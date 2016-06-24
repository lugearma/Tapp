//
//  HashtagCollectionViewController.swift
//  Tapp
//
//  Created by Luis Arias on 22/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagCollectionViewController: UIViewController {
    
    var hastagListWithImage: [Hastag] = [Hastag(hastagTitle: "#FelizDiaDelPadre", tappsNumber: 234, urlImage: "imageOne"), Hastag( hastagTitle: "#SoyViejoCuando", tappsNumber: 567, urlImage: "imageTwo"), Hastag(hastagTitle:  "#MiNoviaMeOdiaSi", tappsNumber: 564, urlImage: "imageThree")]
    
    @IBOutlet var hashtagCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hashtagCollectionView.delegate = self
        self.hashtagCollectionView.dataSource = self
    }
    
    private struct Storyboard {
        static let CellIdentifier = "Hastag Cell Image"
    }
}

extension HashtagCollectionViewController: UICollectionViewDelegate {
    
}

extension HashtagCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hastagListWithImage.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! HashtagCollectionViewCell
        
        cell.hashtag = self.hastagListWithImage[indexPath.item]
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
}
