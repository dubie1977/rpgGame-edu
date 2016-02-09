//
//  File.swift
//  rpgGame
//
//  Created by Joseph DuBay on 2/8/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation

class Monster: Player {
    
    override var attackPower: Int{
        get{
            let isCrit = (1 == Int(arc4random_uniform(UInt32(3) )) )
            if(isCrit){
                return 30
            } else {
                return 10
            }
        }
    }
    
    convenience init(){
        self.init(startingHP: 200, atackPower: 10)
    }
}