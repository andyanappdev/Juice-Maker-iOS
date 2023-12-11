//
//  FruitStoreRepositoryImpl.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

final class FruitStoreRepositoryImpl: FruitStoreRepository {
    // MARK: - Properties & Initializer
    private var fruits: [Fruit]
    
    init(initialQuantity: Int) {
        fruits = FruitType.allCases.map { Fruit(type: $0, quantity: initialQuantity)
        }
    }
    
    
    // MARK: - Methods
    func getFruit(type: FruitType) -> Fruit {
        if let fruitIndex = fruits.firstIndex(where: { $0.type == type }) {
            return fruits[fruitIndex]
        } else {
            fatalError("Fruit not found")
        }
    }
    
    func updateFruit(type: FruitType, quantity: Int) throws {
        if let fruitIndex = fruits.firstIndex(where: { $0.type == type }) {
            guard quantity >= 0 else {
                throw FruitStoreError.invalidQuantity
            }
            
            fruits[fruitIndex].quantity = quantity
        } else {
            throw FruitStoreError.fruitNotFound
        }
    }
}
