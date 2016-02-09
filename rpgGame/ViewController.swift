//
//  ViewController.swift
//  rpgGame
//
//  Created by Joseph DuBay on 1/30/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var rightPlayerImg: UIImageView!
    @IBOutlet weak var leftPlayerImg: UIImageView!
    @IBOutlet weak var rightPlayerHPLbl: UILabel!
    @IBOutlet weak var leftPlayerHPLbl: UILabel!
    @IBOutlet weak var userMSGLbl: UILabel!
    @IBOutlet weak var newGameBtn: UIButton!
    
    
    //local
    var leftPlayer: Player!
    var rightPlayer: Player!
    var gameOver = false
    var winner: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startNewGame()
        
        
        
    }

    func generateReandomPlayer() -> Player{
        let rand = Int(arc4random_uniform(UInt32(100)))
        if(rand % 2 == 0){
            return Hero(name: "John")
        } else{
            return Monster()
        }
        
    }
    
    func updatePlayersHP(msg: String){
        userMSGLbl.text = msg
        rightPlayerHPLbl.text = "\(rightPlayer.hp)"
        leftPlayerHPLbl.text = "\(leftPlayer.hp)"

    }
    
    func startNewGame(){
        leftPlayer = generateReandomPlayer()
        rightPlayer = generateReandomPlayer()
        newGameBtn.hidden = true
        gameOver = false
        updatePlayersHP("Fight ON!!")
    }
    
    func attackPlayer(attacker: Player, victim: Player){
        let attackPower = attacker.attackPower
        
        if(gameOver){
            return
        }
        
        if (victim.attemptAttack(attackPower)){
            if(victim.isAlive){
                updatePlayersHP("Attacked for \(attackPower)")
            } else{
                newGameBtn.hidden = false
                gameOver = true
                if (attacker is Monster){
                    winner = "Monster Wins!!!"
                } else {
                    winner = "Hero Wins!!!"
                }
                
                updatePlayersHP(winner!)
                
            }
        } else {
            updatePlayersHP("Attack Failed")
        }
    }
    
    
    //Actions
    @IBAction func attackPressed(sender: UIButton) {
        switch(sender.tag){
        case 0:
            attackPlayer(leftPlayer, victim: rightPlayer)
                break
        case 1:
            attackPlayer(rightPlayer, victim: leftPlayer)
                break
        default:
                break
        }
        
    }
    
    @IBAction func newGamePressed(sender: UIButton) {
        startNewGame()
    }
    
    
    

}

