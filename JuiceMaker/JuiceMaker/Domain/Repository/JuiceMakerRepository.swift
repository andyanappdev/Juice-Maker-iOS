//
//  JuiceMakerRepository.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

protocol JuiceMakerRepository {
    func makeStrawberryJuice() throws
    
    func makeBananaJuice() throws
    
    func makeKiwiJuice() throws
    
    func makePineappleJuice() throws
    
    func makeStrawberryBananaJuice() throws
    
    func makeMangoJuice() throws
    
    func makeMangoKiwiJuice() throws
    
    func consumeFruit(type: FruitType, quantity: Int) throws
}
