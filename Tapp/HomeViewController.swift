//
//  HomeViewController.swift
//  Tapp
//
//  Created by Luis Arias on 20/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavbar()
    }
    
    func customizeNavbar(){
        let attributes = [ NSForegroundColorAttributeName: UIColor.whiteColor()]
        let navbar = self.navigationController?.navigationBar
        navbar?.tintColor = UIColor.whiteColor()
        navbar?.barStyle = UIBarStyle.BlackTranslucent
        navbar!.titleTextAttributes = attributes
    }
}
