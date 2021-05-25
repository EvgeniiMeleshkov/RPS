//
//  GameState.swift
//  RPS
//
//  Created by Евгений Мелешков on 11.01.2021.
//

import Foundation


enum GameState {
    case start
    case win
    case luse
    case draw
    
    var status: String {
        switch self {
        case .draw:
            return "Its a Drow!"
        case .luse:
            return "You Luse!"
        case .win:
            return "You Won!"
        case .start:
            return "Lets Play?"
        }
    }
}

