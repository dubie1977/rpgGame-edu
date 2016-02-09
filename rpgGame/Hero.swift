//
//  Hero.swift
//  rpgGame
//
//  Created by Joseph DuBay on 2/8/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation

class Hero: Player {
    
    private var _name: String
    
    init(name: String){
        self._name = name
        super.init(startingHP: 150, atackPower: 20)
        
    }
}