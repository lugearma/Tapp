//
//  ItemCell.swift
//  Tapp
//
//  Created by Luis Arias on 10/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    func configureCellForItem(item: MenuItem) {
        self.itemLabel.text = item.itemTitle
        self.itemImage.image = item.itemImage
    }
}
