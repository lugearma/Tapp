//
//  HashtagDetailViewCotroller.swift
//  Tapp
//
//  Created by Luis Arias on 26/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HashtagDetailViewController: UIViewController {
    
    var navbarTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleNavbar(navbarTitle)
    }
    
    func setTitleNavbar(title: String) {
        self.title = title
    }
    
}
