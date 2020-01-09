//
//  TicTacToeViewController.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 1/3/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    @IBOutlet weak var playersTurn: UILabel!
    
    
    @IBOutlet var gameButtons: [UIButton]!
    
    
    @IBOutlet weak var playerOneScore: UILabel!
    
    @IBOutlet weak var playerTwoScore: UILabel!
    
    var winningCombos:[[Int]] = [[0,1,2],[0,3,6],[6,7,8],[3,4,5],[1,4,7],[2,4,6],[2,5,8],[0,4,8]]


       var xMakesMove:[Int] = []
       var oMakesMove:[Int] = []

       var playerStarts = 0
       
       var xScore = 0
       var oScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        playersTurn.text = "Player One Start!"
        playerStarts += 1
        print(playersTurn.text ?? "")
        print(playerStarts)
                playerOneScore.text = "Player1 = 0"
        
                playerTwoScore.text = "Player2 = 0"
    }
    
    
    
    
    @IBAction func newGameButton(_ sender: UIBarButtonItem) {
        for button in gameButtons {
            button.isEnabled = true
            button.setBackgroundImage(nil, for: UIControl.State.normal)        }
        playersTurn.text = "Player One's Turn"
        xMakesMove = []
        oMakesMove = []
        playerStarts = 1
    }
    
    
    
    @IBAction func switchPlayersTurn(_ sender: UIButton) {
        
        
       // print(playerStarts)

        playersChangeTurns()
        printXorO(sender:sender)
        appendTag(sender: sender)
        displayWinner()
        disableAfterWinning()
        
    }
    
    
    
    @IBAction func resetGame(_ sender: UIButton) {
        for button in gameButtons {
            button.isEnabled = true
            button.setBackgroundImage(nil, for: UIControl.State.normal)        }
        playersTurn.text = "Player One's Turn"
        playerOneScore.text = "Player1 = 0"
        
        playerTwoScore.text = "Player2 = 0"
        xMakesMove = []
        oMakesMove = []
        playerStarts = 1
        xScore = 0
        oScore = 0
    }
    
    func playersChangeTurns () {
        
        if playerStarts % 2 == 1 {
           
            playersTurn.text = "Player Two's Turn"
            
//            playerStarts += 1
            
        } else if playerStarts % 2 == 0 {
           
            playersTurn.text = "Player One's Turn"
            
//            playerStarts += 1
        }
    }
    
    
    func printXorO (sender:UIButton) {
        
        
        if playerStarts % 2 == 1 {
            sender.setBackgroundImage(UIImage(named: "xMark"), for: UIControl.State.normal)
          //  playerStarts += 1
        } else if playerStarts % 2 == 0 {
            sender.setBackgroundImage(UIImage(named:
                "oMark"), for: UIControl.State.normal)
        //  playerStarts += 1
        }
    }
    
    
    func appendTag (sender:UIButton) {
        if playerStarts % 2 == 1 {
            playerStarts += 1
            xMakesMove.append(sender.tag)
            sender.isEnabled = false
            print("player one\(xMakesMove)")
            
            
            
            
        } else if playerStarts % 2 == 0 {
            playerStarts += 1
            oMakesMove.append(sender.tag)
            sender.isEnabled = false
            print("player two\(oMakesMove)")
           
        }
    }
    
    
    
    
    func displayWinner () {
        for group in winningCombos {
            
            if xMakesMove.contains(group[0]) && xMakesMove.contains(group[1]) && xMakesMove.contains(group[2])  {
                
                for button in gameButtons {
                    button.isEnabled = false
                }
                xScore += 1
                playersTurn.text = " X Wins!!! 🔥 👏🏾 🥳 "
                playerOneScore.text = "Player1 = \(xScore)"
               
                
            } else if oMakesMove.contains(group[0]) && oMakesMove.contains(group[1]) && oMakesMove.contains(group[2]) {
                
                for button in gameButtons {
                    button.isEnabled = false
                }
                oScore += 1
                playersTurn.text = " O Wins !!! 🔥 👏🏾 🥳"
                playerTwoScore.text = "Player2 = \(oScore)"
               
            }
        }
        
    }
    
    func disableAfterWinning () {
        if playersTurn.text == " O Wins!!! 🔥 👏🏾 🥳 " {
            for button in gameButtons {
                button.isEnabled = false
            }
        } else if playersTurn.text == " X Wins !!! 🔥 👏🏾 🥳" {
            for button in gameButtons {
                button.isEnabled = false
            }
        }
    }

}
