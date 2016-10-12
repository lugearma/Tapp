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
        self.view.isUserInteractionEnabled = true
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
    
    func showFace(_ sender: UITapGestureRecognizer) {
        print("Please Help!")
    }
    
    func showFaceDos(_ sender: UITapGestureRecognizer) {
        print("Please!")
    }
    
    func setupViews() {
        
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showFace(_:)))
        let tapGestureDos = UITapGestureRecognizer(target: self, action: #selector(self.showFaceDos(_:)))
        
        let picker: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
            return pickerView
        }()
        
        let leftView: UIView = {
            let lView = UIView()
            lView.backgroundColor = UIColor.black
            lView.addGestureRecognizer(tapGestureDos)
            return lView
        }()
        
        let rightView: UIView = {
            let rView = UIView()
            rView.backgroundColor = UIColor.orange
            rView.addGestureRecognizer(tapGesture)
            return rView
        }()
        
        self.view.addSubview(leftView)
        self.view.addSubview(rightView)
        self.view.addSubview(picker)
        
        
        self.view.addConstraintsWithFormat("H:|[v0(v1)][v1]|", views: leftView, rightView)
        self.view.addConstraintsWithFormat("H:|[v0]|", views: picker)
        
        self.view.addConstraintsWithFormat("V:|[v0(400)]-8-[v1(400)]-8-[v2]-32-|", views: rightView, leftView, picker)
        self.view.addConstraintsWithFormat("V:|[v0(" + String(describing: screenHeight) + ")]", views: rightView)
        self.view.addConstraintsWithFormat("V:|[v0(" + String(describing: screenHeight) + ")]", views: leftView)
        
    }
}

extension InteractViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var facesArray = createFacesView()
        return facesArray[row]
    }
    
    private func createFacesView() -> [UIView] {
        let emojisArray = [("😄", "😞"), ("😂", "😤"), ("❤️", "💔")]
        var facesArray = [UIView]()

        // TODO: Check how to center element
        for (_, n) in emojisArray.enumerated() {
            
            let faceLabel = UILabel()
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
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return CGFloat(200.0)
    }
}
