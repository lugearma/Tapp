//
//  Hastag.swift
//  Tapp
//
//  Created by Luis Arias on 20/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

class Hastag{
    
    let hastagTitle: String?
    let tappsNumber: Int?
    let urlImage: String?
    
    init(hastagTitle: String, tappsNumber: Int, urlImage: String){
        self.hastagTitle = hastagTitle
        self.tappsNumber = tappsNumber
        self.urlImage = urlImage
    }
    
    init(hastagTitle: String, tappsNumber: Int){
        self.hastagTitle = hastagTitle
        self.tappsNumber = tappsNumber
        self.urlImage = nil
    }
    
    class func crateData() -> [Hastag] {
        let hastagList: [Hastag] = [
            Hastag(hastagTitle: "#FelizDiaDelPadre", tappsNumber: 234),
            Hastag( hastagTitle: "#SoyViejoCuando", tappsNumber: 567),
            Hastag(hastagTitle:  "#MiNoviaMeOdiaSi", tappsNumber: 564),
            Hastag(hastagTitle: "#FelizDiaDelPadre", tappsNumber: 234),
            Hastag( hastagTitle: "#SoyViejoCuando", tappsNumber: 567),
            Hastag(hastagTitle:  "#MiNoviaMeOdiaSi", tappsNumber: 564),
            Hastag(hastagTitle: "#FelizDiaDelPadre", tappsNumber: 234),
            Hastag( hastagTitle: "#SoyViejoCuando", tappsNumber: 567),
            Hastag(hastagTitle:  "#MiNoviaMeOdiaSi", tappsNumber: 564),
            Hastag(hastagTitle: "#FelizDiaDelPadre", tappsNumber: 234),
            Hastag( hastagTitle: "#SoyViejoCuando", tappsNumber: 567),
            Hastag(hastagTitle:  "#MiNoviaMeOdiaSi", tappsNumber: 564)
        ]
        
        return hastagList

    }
}