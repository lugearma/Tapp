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
        self.setupViews()
    }
    
    func setupNavigationBarButton() {
        let dismissViewButton = UIBarButtonItem(image: UIImage(named: "delete"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(InteractViewController.dismissView))

        self.navigationItem.setLeftBarButton(dismissViewButton, animated: true)
    }
    
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }

    func setupViews() {
        
        let picker: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
            return pickerView
        }()
        
        self.view.addSubview(picker)
        
        self.view.addConstraintsWithFormat("H:|[v0]|", views: picker)
        self.view.addConstraintsWithFormat("V:[v0]-32-|", views: picker)
        
    }
}

extension InteractViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var arr = [UIView]()
        let newVIew = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        newVIew.backgroundColor = UIColor.red
        let snewVIew = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        snewVIew.backgroundColor = UIColor.black
        arr.append(newVIew)
        arr.append(snewVIew)
        print(row)
        return arr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
