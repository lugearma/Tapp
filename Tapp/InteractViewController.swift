//
//  InteractViewController.swift
//  Tapp
//
//  Created by Luis Arias on 22/09/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class InteractViewController: UIViewController {
    
    var parentView = ContainerViewController()
    
    var titleLabel = String(){
        didSet {
            self.title = titleLabel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setupNavigationBarButton()
    }
    
    func setupNavigationBarButton() {
        let dismissViewButton = UIBarButtonItem(image: UIImage(named: "delete"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(InteractViewController.dismissView))

        self.navigationItem.setLeftBarButton(dismissViewButton, animated: true)
    }
    
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}
