//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by admin on 6/7/17.
//  Copyright © 2017 KahoTestSwitft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet weak var outputLabel: UIButton!
    
    var activeGame = true
    var activePlayer = 1
    var arraySet = [0,0,0,0,0,0,0,0,0,] //0= empty 1 = nought, 2 = cross
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    
    @IBAction func restartButton(_ sender: Any) {
        winnerLabel.isHidden = true
        restartButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        restartButton.center = CGPoint (x: restartButton.center.x - 500, y: restartButton.center.y)
        
        activeGame = true
        activePlayer = 1
        arraySet = [0,0,0,0,0,0,0,0,0,]
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
       
        
        
    }
    
    @IBOutlet var restartButton: UIButton!
    @IBAction func ticTacToeLocation(_ sender: AnyObject) {
        let senderTag = sender.tag - 1
        
        if arraySet[senderTag] == 0 && activeGame == true {
        
            if activePlayer == 1 {
                sender.setImage(UIImage(named:"nought.png"), for: [])
                print(sender.tag)
                
                arraySet[senderTag] = activePlayer
                
                activePlayer = 2
                
            }else{
                sender.setImage(UIImage(named:"cross.png"), for : [])
                
                arraySet[senderTag] = activePlayer
                
                activePlayer = 1

            }
        }
        
        for var combination in winningCombination{
            if arraySet[combination[0]] != 0 && arraySet[combination[0]] == arraySet[combination[1]] && arraySet[combination[1]] == arraySet[combination[2]] {
                
                UIView.animate(withDuration: 1, animations: {
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                    self.restartButton.center = CGPoint(x: self.restartButton.center.x + 500, y: self.restartButton.center.y)

                })
                
                if arraySet[combination[0]] == 1 {
                    winnerLabel.text = "noughts has won"
                }else{
                    winnerLabel.text = "cross has won"
                }
                activeGame = false
                
                winnerLabel.isHidden = false
                restartButton.isHidden = false
                
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        restartButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        restartButton.center = CGPoint (x: restartButton.center.x - 500, y: restartButton.center.y)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

