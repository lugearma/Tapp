//
//  TrendCollectionViewController.swift
//  Tapp
//
//  Created by Luis Arias on 08/09/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

private let customCellIdentifier = "customCellIdentifier"

protocol TrendCollectionViewControllerDelegate {
    func toggleLeftPanel()
}

class TrendCollectionViewController: UICollectionViewController {
    
    var delegate: TrendCollectionViewControllerDelegate?
    
    let nameOfTrends = ["#FelizDomingo", "#MiPaisNecesitaGenteQue", "#ladyOxxo", "#LordPalo", "#11septiembre"]
    let images = ["felizDomingo", "miPais", "ladyOxxo", "lordPalo", "11Septiembre"]
    let numberOfTaps = ["5043K Tapps", "35454K Tapps", "5650K Tapps", "4353K Tapps", "6794K Tapps"]
    
    var parentView = ContainerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Trends"
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(TrendCollectionViewController.expandMenu))
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: nil, action: nil)
        
        self.navigationItem.setLeftBarButton(menuButton, animated: true)
        self.navigationItem.setRightBarButton(addButton, animated: true)
        
        self.collectionView!.register(CustomCell.self, forCellWithReuseIdentifier: customCellIdentifier)
        self.collectionView?.backgroundColor = UIColor.white
        
    }

    func expandMenu() {
        delegate?.toggleLeftPanel()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameOfTrends.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! CustomCell
    
        configureCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    func configureCell(_ cell: CustomCell, indexPath: IndexPath) {
        
        cell.backgroundCellImage.image = UIImage(named: images[(indexPath as NSIndexPath).item])
        cell.nameTrendLabel.text = nameOfTrends[(indexPath as NSIndexPath).item]
        cell.numberOfTappsLabel.text = numberOfTaps[(indexPath as NSIndexPath).item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let interactView = InteractViewController()
        
        interactView.titleLabel = nameOfTrends[indexPath.item]
        interactView.parentView = parentView
        
        let navigationController = UINavigationController(rootViewController: interactView)
        
        parentView.present(navigationController, animated: true, completion: nil)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension TrendCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 12, height: 140)
    }
}

// MARK: Custom Cell Class

class CustomCell: UICollectionViewCell {
    
    var nameTrendLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Hola"
        label.textColor = UIColor.white
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold" , size: 19)
        
        return label
    }()
    
    var numberOfTappsLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Hola"
        label.textColor = UIColor.white
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight" , size: 16)
        
        return label
    }()
    
    var backgroundCellImage: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "ladyOxxo")
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        return imageView
    }()
    
    var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.addSubview(backgroundCellImage)
        self.addSubview(blackView)
        self.addSubview(nameTrendLabel)
        self.addSubview(numberOfTappsLabel)
        
        self.addConstraintsWithFormat("H:|-16-[v0]|", views: nameTrendLabel)
        self.addConstraintsWithFormat("H:|-16-[v0]", views: numberOfTappsLabel)
        self.addConstraintsWithFormat("H:|[v0]|", views: blackView)
        
        self.addConstraintsWithFormat("V:[v0]-2-[v1]-16-|", views: numberOfTappsLabel, nameTrendLabel)
        self.addConstraintsWithFormat("V:|[v0]|", views: backgroundCellImage)
        self.addConstraintsWithFormat("V:|[v0]|", views: blackView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}

extension UIView {

    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
        
    }
    
}






