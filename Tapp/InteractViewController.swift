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
        
        let screenWidth = self.view.frame.width
        
        let picker: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
            return pickerView
        }()
        
        let leftView: UIView = {
            let lView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth/2, height: 300))
            lView.backgroundColor = UIColor.black
            return lView
        }()
        
        let rightView: UIView = {
            let rView = UIView(frame: CGRect(x: 200, y: 0, width: screenWidth/2, height: 300))
            rView.backgroundColor = UIColor.orange
            return rView
        }()
        
        self.view.addSubview(leftView)
        self.view.addSubview(rightView)
        self.view.addSubview(picker)
        
        
        self.view.addConstraintsWithFormat("H:|[v0(v1)][v1]|", views: leftView, rightView)
        self.view.addConstraintsWithFormat("H:|[v0]|", views: picker)
        
        self.view.addConstraintsWithFormat("V:|[v0(400)]-8-[v1(400)]-8-[v2]-32-|", views: rightView, leftView, picker)
        self.view.addConstraintsWithFormat("V:|[v0(400)]", views: rightView)
        self.view.addConstraintsWithFormat("V:|[v0(400)]", views: leftView)
        
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
//            let faceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
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
