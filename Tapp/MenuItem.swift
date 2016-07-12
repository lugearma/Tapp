//
//  MenuItem.swift
//  Tapp
//
//  Created by Luis Arias on 10/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class MenuItem: NSObject {

    var itemTitle: String?
    var itemImage: UIImage?
    
    init(title: String, image: UIImage){
        self.itemTitle = title
        self.itemImage = image
    }
    
    class func createItems() -> [MenuItem]{
        return [
            MenuItem(title: "Settings", image: UIImage(named: "settings")!),
            MenuItem(title: "Profile", image: UIImage(named: "profile")!),
            MenuItem(title: "Notifications", image: UIImage(named: "notifications")!)
        ]
    }
}
