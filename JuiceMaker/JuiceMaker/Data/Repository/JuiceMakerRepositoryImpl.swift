//
//  JuiceMakerRepositoryImpl.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

final class JuiceMakerRepositoryImpl: JuiceMakerRepository {
    // MARK: - Properties & Initializer
    private var fruiteStoreRepository: FruitStoreRepository
    
    init(fruiteStoreRepository: FruitStoreRepository) {
        self.fruiteStoreRepository = fruiteStoreRepository
    }
    
    
    // MARK: - Methods
    func makeStrawberryJuice() throws {
        try consumeFruit(type: FruitType.strawberry, quantity: 16)
    }
    
    func makeBananaJuice() throws {
        try consumeFruit(type: FruitType.banana, quantity: 2)
    }
    
    func makeKiwiJuice() throws {
        try consumeFruit(type: FruitType.kiwi, quantity: 3)
    }
    
    func makePineappleJuice() throws {
        try consumeFruit(type: FruitType.pineapple, quantity: 2)
    }
    
    func makeStrawberryBananaJuice() throws {
        let strawberryQuantity = fruiteStoreRepository.getFruit(type: FruitType.strawberry).quantity
        let bananaQuantity = fruiteStoreRepository.getFruit(type: FruitType.banana).quantity
        
        guard strawberryQuantity >= 10 && bananaQuantity >= 1 else {
            throw JuiceMakerError.insufficientFruit
        }
        
        try consumeFruit(type: FruitType.strawberry, quantity: 10)
        try consumeFruit(type: FruitType.banana, quantity: 1)
    }
    
    func makeMangoJuice() throws {
        try consumeFruit(type: FruitType.mango, quantity: 3)
    }
    
    func makeMangoKiwiJuice() throws {
        let mangoyQuantity = fruiteStoreRepository.getFruit(type: FruitType.mango).quantity
        let kiwiQuantity = fruiteStoreRepository.getFruit(type: FruitType.kiwi).quantity
        
        guard mangoyQuantity >= 2 && kiwiQuantity >= 1 else {
            throw JuiceMakerError.insufficientFruit
        }
        
        try consumeFruit(type: FruitType.mango, quantity: 2)
        try consumeFruit(type: FruitType.kiwi, quantity: 1)
    }
    
    func consumeFruit(type: FruitType, quantity: Int) throws {
        let availableQuantity = fruiteStoreRepository.getFruit(type: type).quantity
        guard availableQuantity >= quantity else {
            throw JuiceMakerError.insufficientFruit
        }
        
        try fruiteStoreRepository.updateFruit(type: type, quantity: availableQuantity - quantity)
    }
}
