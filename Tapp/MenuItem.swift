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
            MenuItem(title: "Configuracion", image: UIImage(named: "bell")!),
            MenuItem(title: "Mensajes", image: UIImage(named: "bell")!),
            MenuItem(title: "Perfil", image: UIImage(named: "bell")!),
            MenuItem(title: "Notificaciones", image: UIImage(named: "bell")!)
        ]
    }
}
