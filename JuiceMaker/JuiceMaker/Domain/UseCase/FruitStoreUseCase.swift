//
//  FruitStoreUseCase.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

struct FruitStoreUseCase {
    // MARK: - Properties & Initializer
    private var repository: FruitStoreRepository
    
    init(repository: FruitStoreRepository) {
        self.repository = repository
    }
    
    
    // MARK: - Methods
    func getFruit(type: FruitType) -> Fruit {
        return repository.getFruit(type: type)
    }
    
    func updateFruit(type: FruitType, quantity: Int) -> Result<Void, Error> {
        do {
            try repository.updateFruit(type: type, quantity: quantity)
            return Result.success(())
        } catch {
            return Result.failure(error)
        }
        
    }
}
