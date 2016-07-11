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
            MenuItem(title: "item 1", image: UIImage(named: "bell")!),
            MenuItem(title: "item 2", image: UIImage(named: "bell")!),
            MenuItem(title: "item 3", image: UIImage(named: "bell")!),
            MenuItem(title: "item 4", image: UIImage(named: "bell")!)
        ]
    }
}
