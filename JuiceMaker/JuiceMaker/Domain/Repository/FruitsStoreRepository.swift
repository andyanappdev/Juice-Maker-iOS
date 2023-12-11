//
//  FruitsStoreRepository.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

protocol FruitStoreRepository {
    func getFruit(type: FruitType) -> Fruit
    func updateFruit(type: FruitType, quantity: Int) throws
}
