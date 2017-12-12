//
//  ViewController.swift
//  tictactoe
//
//  Created by भाषि on 12/10/17.
//  Copyright © 2017 bhashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var PlayAgain: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        
        activeGame = true
        
        activePlayer = 1 //1 = nought,2 = cross
        
        gameState = [0,0,0,0,0,0,0,0,0]//0 - empty, 1 - nought, 2 - cross
        
        
        for i in 1..<10 {
                        
            if let button = view.viewWithTag(i) as? UIButton{
                
                button.setImage(nil, for: [])
            }
            
            winnerLabel.isHidden = true
            PlayAgain.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            PlayAgain.center = CGPoint(x: PlayAgain.center.x - 500, y: PlayAgain.center.y)
        }
        
    }
    
    var activeGame = true
    
    var activePlayer = 1 //1 = nought,2 = cross
    
    var gameState = [0,0,0,0,0,0,0,0,0]//0 - empty, 1 - nought, 2 - cross

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        if gameState[activePosition] == 0 && activeGame{
            
            gameState[activePosition] = activePlayer

            if activePlayer == 1 {
                
                sender.setImage(UIImage(named:"nought"), for: [])
                activePlayer = 2
                
            }else {
                
                sender.setImage(UIImage(named:"cross"), for: [])
                activePlayer = 1
                
            }
            
            for combination in winningCombinations{
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    //winner
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    PlayAgain.isHidden = false
                    
                    if gameState[combination[0]] == 1{
                        
                        winnerLabel.text = "Noughts have won!"
                    }else{
                        
                        winnerLabel.text = "Crosses have won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.PlayAgain.center = CGPoint(x: self.PlayAgain.center.x + 500, y: self.PlayAgain.center.y)
                    })
                }
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        PlayAgain.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        PlayAgain.center = CGPoint(x: PlayAgain.center.x - 500, y: PlayAgain.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

