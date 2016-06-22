//
//  HashtagCollection.swift
//  Tapp
//
//  Created by Luis Arias on 21/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit
import Foundation
class HashtagCollection: NSObject{
    
    var hastagListWithImage: [Hastag] = [Hastag(hastagTitle: "#FelizDiaDelPadre", tappsNumber: 234, urlImage: "imageOne"), Hastag( hastagTitle: "#SoyViejoCuando", tappsNumber: 567, urlImage: "imageTwo"), Hastag(hastagTitle:  "#MiNoviaMeOdiaSi", tappsNumber: 564, urlImage: "imageThree")]
    
    private struct Storyboard {
        static let CellIdentifier = "Hastag Cell Image"
    }

    
}

extension HashtagCollection: UICollectionViewDataSource {
    
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
