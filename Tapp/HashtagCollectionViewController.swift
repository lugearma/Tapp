//
//  HashtagCollectionViewController.swift
//  Tapp
//
//  Created by Luis Arias on 22/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    let hashtagColletion = HashtagCollection()
    
    @IBOutlet var hashtagCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hashtagCollectionView.delegate = self
        self.hashtagCollectionView.dataSource = hashtagColletion
    }
    
    
    
}
