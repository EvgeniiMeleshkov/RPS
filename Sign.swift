//
//  Sign.swift
//  RPS
//
//  Created by Евгений Мелешков on 11.01.2021.
//
import Foundation


func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock
    case scissors
    case paper
    
    var emoji: String {
        switch self {
        case .rock:
            return "🗿"
        case .scissors:
            return "✂️"
        case .paper:
            return "🧻"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {
        if self == opponentSign {
            return .draw
        }
        
        switch self {
        case .paper:
            if opponentSign == .rock {
                return .win
            }
        case .rock:
            if opponentSign == .scissors {
                return .win
            }
        case .scissors:
            if opponentSign == .paper {
                return .win
            }
        }
        return .luse
    }
}


