//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/4/23.
//

struct Fruit {
    let type: FruitType
    var quntity: Int
}

enum FruitType: String {
    case strawberry, banana, pineapple, kiwi, mango
}
