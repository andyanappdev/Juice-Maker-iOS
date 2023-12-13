//
//  DependencyInjection.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/12/23.
//

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
    
    // ViewController
    private let juiceMakerViewController: JuiceMakerViewController
    private let inventoryViewController: InventoryViewController
    
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
        // ViewController
        self.juiceMakerViewController = JuiceMakerViewController(viewModel: juiceMakerViewModel)
        self.inventoryViewController = InventoryViewController(viewModel: juiceMakerViewModel)
    }
    
    
    // MARK: Methods
//    func injectDependencies() {
//        
//    }
    
    func getJuiceMakerViewController() -> JuiceMakerViewController {
        return juiceMakerViewController
    }
    
    func getInventoryViewController() -> InventoryViewController {
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
