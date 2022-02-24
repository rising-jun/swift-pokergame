//
//  CardDeck.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/22.
//

import Foundation
struct CardDeck{
    public var count: Int{
        return cards.count
    }
    private var cards: [PockerCard] = []
    private let cardShapes = PockerCard.Shape.allCases
    private let cardNumbers = PockerCard.Number.allCases
    
    init(){
        reset()
    }
    
    private mutating func initCardDeckArray(){
        for shape in cardShapes{
            for number in cardNumbers{
                let card = PockerCard(shape: shape, number: number)
                cards.append(card)
            }
        }
    }
    
    mutating func shuffle(){
        if count > 1{
            for i in 0 ..< cards.count - 1 { // 0 ~ n-2
                let randomIndex = Int.random(in: i ..< cards.count)
                let temp = cards[i]
                cards[i] = cards[randomIndex]
                cards[randomIndex] = temp
            }
        }
    }
    
    mutating func removeOne() -> Result<PockerCard, CardDeckError>{
        if count > 0{
            guard let card = cards.last else { return .failure(.nonCardInDeck) }
            cards.removeLast()
            return .success(card)
        }
        return .failure(.nonCardInDeck)
    }
    
    mutating func reset(){
        initCardDeckArray()
        shuffle()
    }
}

enum CardDeckError: Error{
    case nonCardInDeck
}
