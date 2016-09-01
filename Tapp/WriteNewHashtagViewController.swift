//
//  WriteNewHashtagViewController.swift
//  Tapp
//
//  Created by Luis Arias on 14/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class WriteNewHashtagViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.newContentHashtagTextView.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
    }
    
    func setupCustomTableViewBackground() {
        //Create custom view
        let patternView = UIView(frame: self.view.frame)
        let image = UIImageView(image: UIImage(named: "background"))
        
        //Create blur view
        let blur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blur)
        
        self.view.bounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        image.frame = self.view.bounds
        patternView.insertSubview(image, atIndex: 0)
        patternView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        blurView.frame = self.view.bounds
        patternView.insertSubview(blurView, atIndex: 1)
        
        //set backgroundView to tableView
        self.view.addSubview(patternView)
    }
}
