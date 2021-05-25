//
//  ViewController.swift
//  RPS
//
//  Created by Евгений Мелешков on 11.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appsSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var playerSignRock: UIButton!
    @IBOutlet weak var playerSignScissors: UIButton!
    @IBOutlet weak var playerSignPaper: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        gameUpdate(.start)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func playersChoicePaper(_ sender: Any) {
        play(playersChoice: .paper)
    }
    @IBAction func playersChoiceScissors(_ sender: Any) {
        play(playersChoice: .scissors)
    }
    @IBAction func playersChoiceRock(_ sender: Any) {
        play(playersChoice: .rock)
    }
    @IBAction func actionPlayAgain(_ sender: Any) {
        gameUpdate(.start)
    }
    
    func gameUpdate(_ currentStatus: GameState) {
        gameStatus.textColor = #colorLiteral(red: 0.2516664267, green: 0.2895430326, blue: 0.3090229332, alpha: 1)
        if currentStatus == .draw {
            view.backgroundColor = #colorLiteral(red: 0.6816804847, green: 0.7350924745, blue: 0.6919111395, alpha: 1)
            gameStatus.text = GameState.draw.status
        }
        else if currentStatus == .luse {
            view.backgroundColor = #colorLiteral(red: 1, green: 0.2973267432, blue: 0.4107408588, alpha: 1)
            gameStatus.text = GameState.luse.status
        } else if currentStatus == .win {
            view.backgroundColor = #colorLiteral(red: 0.3084608844, green: 0.7239849065, blue: 0.400483631, alpha: 1)
            gameStatus.text = GameState.win.status
        }
        if currentStatus == .start {
            gameStatus.text = GameState.start.status
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.6919111395, alpha: 1)
            playAgainButton.isHidden = true
            appsSign.text = "💻"
            playerSignRock.isHidden = false
            playerSignPaper.isHidden = false
            playerSignScissors.isHidden = false
            playerSignRock.isEnabled = true
            playerSignPaper.isEnabled = true
            playerSignScissors.isEnabled = true
        }
    }
    
    func play(playersChoice :Sign) {
        let computerSign = randomSign()
        let gameState = playersChoice.gameState(against: computerSign)
        
        gameUpdate(gameState)
        
        appsSign.text = computerSign.emoji
        
        playerSignRock.isHidden = true
        playerSignPaper.isHidden = true
        playerSignScissors.isHidden = true
        
        playerSignRock.isEnabled = false
        playerSignPaper.isEnabled = false
        playerSignScissors.isEnabled = false
        
        playAgainButton.isHidden = false
    }

}

