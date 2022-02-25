//
//  Players.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/24.
//

import Foundation
import UIKit

struct Players{
    static let playerNames: [String] = ["ebony","eddy","gucci","chez"]
    private var players: [Player] = []
    var count: Int{
        return players.count
    }
    
    var allCardCount: Int{
        var answer = 0
        for index in 0 ..< count{
            answer += players[index].playerCardCount
        }
        return answer
    }
    
    init(playerCount: PockerGame.PlayerCount){
        var range = 0
        switch playerCount{
        case .one:
            range = 1
        case .two:
            range = 2
        case .three:
            range = 3
        case .four :
            range = 4
        }
        for index in 0 ..< range{
            players.append(Player(name: Players.playerNames[index]))
        }
    }
    
    func takeCard(index: Int, card: PockerCard){
        players[index].receiveCard(card: card)
    }
    
}
