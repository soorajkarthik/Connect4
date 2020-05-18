//
//  ViewController.swift
//  Connect4
//
//  Created by Karthik, Sooraj on 12/5/18.
//  Copyright © 2018 Karthik, Sooraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board: [[Int]] = [[0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0]]
    var wins: Int = 0
    var losses: Int = 0
    var turn: Int = 1;
    @IBOutlet weak var pieceView: UIView!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    
    
    
    
    @IBOutlet weak var label: UILabel!
    //1 = Player's Turn, 2 = CPU's turn
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let column: Int = sender.tag
        
        if(board[0][column] == 0) {
            placePiece(column: column)
            updateDisplay()
            
            if checkForWin() {
                wins += 1
                resetBoard()
                
            }
            
            turn = 2
        
            var random: Int = 0
        
            while true {
                random = Int.random(in: 0...6)
                if board[0][random] == 0 {
                    break
                }
            }
            placePiece(column: random)
            updateDisplay()
            
            if checkForWin() {
                losses += 1
                resetBoard()
                
            }
            
            disableButtons()
            turn = 1
        }
        
        
    }
    
    func placePiece(column: Int) {
        var row = 0
        while row < 5 {
            if board[row + 1][column] == 0 {
                row += 1
            }
                
            else {
                break
            }
        }
        
        board[row][column] = turn
        for array in board {
            print(array)
        }
        
        print()
        
    }
    
    func checkForWin() -> Bool {
        
        //horizontal check
        for r in 0..<board.count {
            for c in 0..<board[0].count-3 {
                if board[r][c] == turn && board[r][c+1] == turn && board[r][c+2] == turn && board[r][c+3] == turn{
                    return true
                }
            }
        }

        // verticalCheck
        for r in 0..<board.count-3 {
            for c in 0..<board[0].count {
                if board[r][c] == turn && board[r+1][c] == turn && board[r+2][c] == turn && board[r+3][c] == turn{
                    return true
                }
            }
        }

        //ascend diagonals (bottom left to top right)
        for r in 3..<board.count {
            for c in 0..<board[0].count-3 {
                if board[r][c] == turn  && board[r-1][c+1] == turn  && board[r-2][c+2] == turn  && board[r-3][c+3] == turn {
                    return true
                }
            }
        }

        //descending diagonals (top left to bottom right)
        for r in 3..<board.count {
            for c in 3..<board[0].count {
                if board[r][c] == turn  && board[r-1][c-1] == turn  && board[r-2][c-2] == turn  && board[r-3][c-3] == turn {
                    return true
                }
            }
        }

        return false;
        
    }
        
    func resetBoard() {
  
        board = [[0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0], [0,0,0,0,0,0,0]]
        turn = 1
        //add code to clear the board
    }
    
    func updateDisplay() {
        
        label.text = "Wins: \(wins), Losses: \(losses)"
        
        for r in 0..<board.count {
            for c in 0..<board[0].count {
                
                let myView = ShapeView(frame: CGRect(x: c*90, y: r*80 + 7, width: 85, height: 80), shape: 1)
                
                if board[r][c] == 0 {
                    myView.backgroundColor = UIColor.white
                }
                else if board[r][c] == 1 {
                    myView.backgroundColor = UIColor.red
                }
                else if board[r][c] == 2 {
                    myView.backgroundColor = UIColor.yellow
                }
                
                
                pieceView.addSubview(myView)
            }
        }
    }
    
    
    
    func disableButtons() {
      
    }
}

