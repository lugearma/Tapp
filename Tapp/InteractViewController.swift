//
//  InteractViewController.swift
//  Tapp
//
//  Created by Luis Arias on 22/09/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

enum EmojiState: String {
    case topState = "😄😞"
    case middleState = "😂😤"
    case bottomState = "❤️💔"
}

class InteractViewController: UIViewController {
    
    var parentView = ContainerViewController()
    var emojiState = EmojiState.topState.rawValue
    
    
//    var titleLabel = String(){
//        didSet {
//            self.title = titleLabel
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.isUserInteractionEnabled = true
//        setupNavigationBarButton()
        self.setupViews()
        print(emojiState[emojiState.index(before: emojiState.endIndex)])
        print(emojiState[emojiState.index(emojiState.startIndex, offsetBy: 0)])
    }
    
    func setupNavigationBarButton() {
        let dismissViewButton = UIBarButtonItem(image: UIImage(named: "delete"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(InteractViewController.dismissView))
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.setLeftBarButton(dismissViewButton, animated: true)
    }
    
    func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //TODO: Remove repeated code
    
    func showEmoji(_ sender: UITapGestureRecognizer) {
        
        let screenHeight = self.view.frame.size.height
        let screenWidth = self.view.frame.size.width
        
        let size = CGFloat(arc4random_uniform(40)) + 40
        let xPositon = CGFloat(arc4random_uniform(UInt32(screenWidth))) - 25
        let yFinalPosition = CGFloat(arc4random_uniform(UInt32(screenHeight))) - (screenHeight/2)
        let duration = 2.0
        let delay = 0.0
        let options = UIViewAnimationOptions.curveLinear

        let emoji = UILabel()
        
        emoji.text = String(emojiState[emojiState.index(before: emojiState.endIndex)])
        emoji.font = UIFont.boldSystemFont(ofSize: 30)
        emoji.frame = CGRect(x: xPositon, y: screenHeight, width: 90, height: 90)
        
        self.view.addSubview(emoji)
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            emoji.alpha = 0.0
            emoji.frame = CGRect(x: xPositon, y: yFinalPosition, width: 90, height: 90)
            emoji.font = UIFont.boldSystemFont(ofSize: size)
            }, completion: { animationFinished in
                emoji.removeFromSuperview()
        })
    }
    
    func showEmojiDos(_ sender: UITapGestureRecognizer) {
        
        let screenHeight = self.view.frame.size.height
        let screenWidth = self.view.frame.size.width
        
        let size = CGFloat(arc4random_uniform(40)) + 40
        let xPositon = CGFloat(arc4random_uniform(UInt32(screenWidth))) - 25
        let yFinalPosition = CGFloat(arc4random_uniform(UInt32(screenHeight))) - (screenHeight/2)
        let duration = 2.0
        let delay = 0.0
        let options = UIViewAnimationOptions.curveLinear
        
        let emoji = UILabel()
        emoji.text = String(emojiState[emojiState.index(emojiState.startIndex, offsetBy: 0)])
        emoji.font = UIFont.boldSystemFont(ofSize: 30)
        emoji.frame = CGRect(x: xPositon, y: screenHeight, width: 90, height: 90)
        
        self.view.addSubview(emoji)
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            emoji.alpha = 0.0
            emoji.frame = CGRect(x: xPositon, y: yFinalPosition, width: 90, height: 90)
            emoji.font = UIFont.boldSystemFont(ofSize: size)
            }, completion: { animationFinished in
                emoji.removeFromSuperview()
        })

    }
    
    func setupViews() {

        let screenHeight = self.view.frame.height
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showEmoji(_:)))
        let tapGestureDos = UITapGestureRecognizer(target: self, action: #selector(self.showEmojiDos(_:)))
        
        let picker: UIPickerView = {
            let pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
            
            return pickerView
        }()
        
        let leftView: UIView = {
            let lView = UIView()
            lView.backgroundColor = UIColor.clear
            lView.addGestureRecognizer(tapGestureDos)
            return lView
        }()
        
        let rightView: UIView = {
            let rView = UIView()
            rView.backgroundColor = UIColor.clear
            rView.addGestureRecognizer(tapGesture)
            return rView
        }()
        
        let dissmisModalButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "deleteBlue"), for: UIControlState.normal)
            button.addTarget(self, action: #selector(self.dismissView(_:)), for: UIControlEvents.touchUpInside)
            return button
        }()
        
        self.view.addSubview(leftView)
        self.view.addSubview(rightView)
        self.view.addSubview(picker)
        self.view.addSubview(dissmisModalButton)
        
        
        self.view.addConstraintsWithFormat("H:|[v0(v1)][v1]|", views: leftView, rightView)
        self.view.addConstraintsWithFormat("H:|[v0]|", views: picker)
        self.view.addConstraintsWithFormat("H:|-16-[v0]", views: dissmisModalButton)
        
        self.view.addConstraintsWithFormat("V:|[v0(400)]-8-[v1(400)]-8-[v2]-32-|", views: rightView, leftView, picker)
        self.view.addConstraintsWithFormat("V:|[v0(" + String(describing: screenHeight) + ")]", views: rightView)
        self.view.addConstraintsWithFormat("V:|[v0(" + String(describing: screenHeight) + ")]", views: leftView)
        self.view.addConstraintsWithFormat("V:|-32-[v0]", views: dissmisModalButton)
        
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 { emojiState = EmojiState.topState.rawValue }
        if row == 1 { emojiState = EmojiState.middleState.rawValue }
        if row == 2 { emojiState = EmojiState.bottomState.rawValue }
        print(row)
    }
}














