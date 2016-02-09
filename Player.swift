//
//  Player.swift
//  rpgGame
//
//  Created by Joseph DuBay on 2/8/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import Foundation

class Player {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 10

    
    var hp: Int {
        get{
            return _hp
        }
    }
    
    var attackPower: Int{
        get{
            return _attackPower
        }
    }
    
    var isAlive: Bool{
        get{
            if( _hp > 0){
                return true
            } else{
                return false
            }
        }
    }
    
    init(startingHP: Int, atackPower: Int){
        _hp = startingHP
        _attackPower = atackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool{
        self._hp -= attackPower
        return true
    }
}