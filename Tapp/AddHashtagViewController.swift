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
    @IBOutlet weak var addNewTrendTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleNavbar(navbarTitle)
        addBorderBottomToTextField(addNewTrendTextField)
        putWhiteColorToPlaceholderText(addNewTrendTextField)
    }
    
    func addBorderBottomToTextField(textField: UITextField) {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRectMake(0.0, textField.frame.size.height - 1, textField.frame.size.width, 1.0);
        bottomBorder.backgroundColor = UIColor.whiteColor().CGColor
        textField.layer.addSublayer(bottomBorder)
    }
    
    
    func putWhiteColorToPlaceholderText(textField: UITextField) {
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        textField.attributedPlaceholder = NSAttributedString(string: "Add new trend", attributes:attributes)
    }
    
    func setTitleNavbar(title: String) {
        self.title = title
    }
}
