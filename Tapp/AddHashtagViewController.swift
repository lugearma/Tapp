//
//  AddHashtagViewController.swift
//  Tapp
//
//  Created by Luis Arias on 11/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

extension UIColor {
    public class func mainColor() -> UIColor {
        return UIColor(red: 104/255, green: 152/255, blue: 153/255, alpha: 1.0)
    }
}

class AddHashtagViewController: UIViewController {
    
    var navbarTitle = ""
    var mainColor = UIColor()
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.delegate = self
        self.textView.text = "Add a new trend"
        self.textView.textColor = UIColor.lightGrayColor()
        
        self.createButton.backgroundColor = UIColor.mainColor()
        
        setTitleNavbar(navbarTitle)
        addnavBar()
        addGesture()
        
        cornerRadius(self.textView, self.createButton, radius: 5)
        customToolBar()
        
        self.textView.becomeFirstResponder()
    }
    
    func  customToolBar() {
        let customView = UIView(frame: CGRectMake(0, 0, 10, 50))
//        let marker = UIImageView(image: UIImage(named: "marker"))
        let y = customView.frame.height / 2
//        let x = customView.frame.width / 2
        let marker = UIImageView(frame: CGRect(x: 10, y: y, width: 30.0, height: 30.0))
        marker.image = UIImage(named: "marker")
        marker.center.y = y
        
        customView.backgroundColor = UIColor.mainColor()
        customView.addSubview(marker)
        
        
        self.textView.inputAccessoryView = customView
    }
    
    func cornerRadius(views: UIView..., radius: CGFloat) {
        for view in views {
            view.layer.cornerRadius = radius
            view.clipsToBounds = true
        }
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
        let navBar = UINavigationBar(frame: bounds)
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
        
//        if textView.textColor == UIColor.lightGrayColor() {
//            textView.text = ""
//            textView.textColor = UIColor.whiteColor()
//        }
        
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        
        if textView.text == "" {
            textView.textColor = UIColor.lightGrayColor()
            textView.text = "Add a new trend"
        }
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
