//
//  DependencyInjection.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

import UIKit

struct DependencyInjection {
    // MARK: Properties
    
//    static let shared = DependencyInjection()
    
    // Reposity
    private let fruitRepository: FruitStoreRepository
    private let juiceMakerRepository: JuiceMakerRepository
    
    // UseCase
    private let fruitStoreUseCase: FruitStoreUseCase
    private let juiceMakerUseCase: JuiceMakerUseCase
    
    // ViewModel
    private let juiceMakerViewModel: JuiceMakerViewModel
    
    
    // Initialization
    init() {
        // Repository
        self.fruitRepository = FruitStoreRepositoryImpl(initialQuantity: 10)
        self.juiceMakerRepository = JuiceMakerRepositoryImpl(fruiteStoreRepository: fruitRepository)
        // UseCase
        self.fruitStoreUseCase = FruitStoreUseCase(repository: fruitRepository)
        self.juiceMakerUseCase = JuiceMakerUseCase(repository: juiceMakerRepository)
        // ViewModel
        self.juiceMakerViewModel = JuiceMakerViewModel(fruitStoreUseCase: fruitStoreUseCase, juiceMakerUseCase: juiceMakerUseCase)
    }
    
    
    // MARK: Methods
    func injectDependencies() -> JuiceMakerViewModel {
        return juiceMakerViewModel
    }
    
    func getJuiceMakerViewController() -> JuiceMakerViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .none)
        
        guard let juiceMakerViewController = storyboard.instantiateViewController(withIdentifier: JuiceMakerViewController.storyboardIdentifier) as? JuiceMakerViewController else {
            fatalError("Could not instantiate JuiceMakerViewController from storyboard.")
        }
        
        juiceMakerViewController.configure(with: juiceMakerViewModel)
        return juiceMakerViewController
    }
    
    func getInventoryViewController() -> InventoryViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .none)
        
        guard let inventoryViewController = storyboard.instantiateViewController(withIdentifier: InventoryViewController.storyboardIdentifier) as? InventoryViewController else {
            fatalError("Could not instantiate InventoryViewController from storyboard.")
        }
        
        inventoryViewController.configure(with: juiceMakerViewModel)
        return inventoryViewController
    }
}

//    let fruitRepository: FruitStoreRepository = FruitStoreRepositoryImpl(initialQuantity: 10)
//    let juiceMakerRepository: JuiceMakerRepository = JuiceMakerRepositoryImpl(fruiteStoreRepository: fruitRepository)
//
//    let fruitStoreUseCase: FruitStoreUseCase = FruitStoreUseCase(repository: fruitRepository)
//    let juiceMakerUseCase: JuiceMakerUseCase = JuiceMakerUseCase(repository: juiceMakerRepository)
//
//    let juiceMakerViewModel = JuiceMakerViewModel(fruitStoreUseCase: fruitStoreUseCase, juiceMakerUseCase: juiceMakerUseCase)
//
//    let juiceMakerViewController = JuiceMakerViewController(viewModel: juiceMakerViewModel)
//
//    let inventoryViewController = InventoryViewController(viewModel: juiceMakerViewModel)
