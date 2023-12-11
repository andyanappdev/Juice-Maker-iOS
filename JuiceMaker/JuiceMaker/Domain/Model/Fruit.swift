//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/4/23.
//

struct Fruit {
    let type: FruitType
    var quantity: Int
}

enum FruitType: String, CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}
