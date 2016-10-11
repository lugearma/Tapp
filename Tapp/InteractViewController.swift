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
            
            
            // Get the superview's layout
            let margins = pickerView.layoutMarginsGuide
            
            // Pin the leading edge of myView to the margin's leading edge
            pickerView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            
            // Pin the trailing edge of myView to the margin's trailing edge
            pickerView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            
            // Give myView a 1:2 aspect ratio
            pickerView.heightAnchor.constraint(equalTo: pickerView.widthAnchor, multiplier: 2.0)
            
            
            return pickerView
        }()
        
        self.view.addSubview(picker)
        
        self.view.addConstraintsWithFormat("H:|[v0]|", views: picker)
        self.view.addConstraintsWithFormat("V:[v0]-32-|", views: picker)
        
    }
}

extension InteractViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var facesArray = createFacesView()
//        pickerView.addConstraintsWithFormat("H:|[v0]|", views: facesArray[0])
        return facesArray[row]
    }
    
    private func createFacesView() -> [UIView] {
        let emojisArray = [("😄", "😞"), ("😂", "😤"), ("❤️", "💔")]
        var facesArray = [UIView]()

        // TODO: Check how to center element
        for (_, n) in emojisArray.enumerated() {
            
            let faceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
            faceLabel.text = n.0 + "  " + n.1
            faceLabel.font = UIFont.boldSystemFont(ofSize: 50)
            facesArray.append(faceLabel)
            
            
        }
        
        return facesArray
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}
