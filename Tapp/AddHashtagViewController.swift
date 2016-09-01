//
//  AddHashtagViewController.swift
//  Tapp
//
//  Created by Luis Arias on 11/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class AddHashtagViewController: UIViewController {
    
    var navbarTitle = ""
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.delegate = self
        self.textView.text = "Add a new tred"
        self.textView.textColor = UIColor.lightGrayColor()
        setTitleNavbar(navbarTitle)
        addnavBar()
        addGesture()
    }
    
    func addGesture() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddHashtagViewController.hideKeyboard)))
    }
    
    func hideKeyboard() {
        self.textView.resignFirstResponder()
    }
    
    func addnavBar() {
        var itemsArray: [UINavigationItem] = []
        let itemOne = UINavigationItem()
        itemOne.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "delete"), style: .Plain, target: nil, action: #selector(AddHashtagViewController.hideModalView(_:)))
        itemsArray.append(itemOne)
        
        let width = self.view.frame.width
        let bounds = CGRect(x: 0, y: 0, width: width, height: 70)
        var navBar = UINavigationBar(frame: bounds)
        navBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navBar.shadowImage = UIImage()
        navBar.translucent = true
        navBar.tintColor = UIColor(white: 1.0, alpha: 1.0)
        navBar.items = itemsArray
        self.view.addSubview(navBar)
    }

    func hideModalView(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func setTitleNavbar(title: String) {
        self.title = title
    }
}

extension AddHashtagViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        textView.text = ""
        textView.textColor = UIColor.whiteColor()
        
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        
        if (textView.text == "") {
            textView.text = "Add a new tred"
            textView.textColor = UIColor.lightGrayColor()
        }
    }
}
