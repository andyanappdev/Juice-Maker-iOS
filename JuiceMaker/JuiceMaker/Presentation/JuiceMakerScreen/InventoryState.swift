//
//  InventoryState.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

struct InventoryState: Equatable {
    var strawberryQuantity: Int
    var bananaQuantity: Int
    var pineappleQuantity: Int
    var kiwiQuantity: Int
    var mangoQuantity: Int
    
    init(
        strawberryQuantity: Int = 0,
        bananaQuantity: Int = 0,
        pineappleQuantity: Int = 0,
        kiwiQuantity: Int = 0,
        mangoQuantity: Int = 0
    ) {
        self.strawberryQuantity = strawberryQuantity
        self.bananaQuantity = bananaQuantity
        self.pineappleQuantity = pineappleQuantity
        self.kiwiQuantity = kiwiQuantity
        self.mangoQuantity = mangoQuantity
    }
    
    func copyWith(
        strawberryQuantity: Int? = nil,
        bananaQuantity: Int? = nil,
        pineappleQuantity: Int? = nil,
        kiwiQuantity: Int? = nil,
        mangoQuantity: Int? = nil
    ) -> InventoryState {
        return InventoryState(
            strawberryQuantity: strawberryQuantity ?? self.strawberryQuantity,
            bananaQuantity: bananaQuantity ?? self.bananaQuantity,
            pineappleQuantity: pineappleQuantity ?? self.pineappleQuantity,
            kiwiQuantity: kiwiQuantity ?? self.kiwiQuantity,
            mangoQuantity: mangoQuantity ?? self.mangoQuantity
        )
    }
}
