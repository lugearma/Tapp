//
//  PageContentViewController.swift
//  Tapp
//
//  Created by Luis Arias on 27/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController{
    
    @IBOutlet weak var titleLabel: UILabel!
    var pageIndex: UInt?
    var pageTitle: String?
    
    override func viewDidLoad() {
        self.titleLabel.text = self.pageTitle
    }
}
