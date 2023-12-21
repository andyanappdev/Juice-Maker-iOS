//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    private let juiceMakerUseCase: JuiceMaker?
    
    private let router: JuiceMakerRoutable?
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    required init?(coder: NSCoder) {
        self.juiceMakerUseCase = nil
        self.router = nil
        super.init(coder: coder)
    }
    
    init?(
        coder: NSCoder,
        juiceMakerUseCase: JuiceMaker,
        router: JuiceMakerRouter
    ) {
        self.juiceMakerUseCase = juiceMakerUseCase
        self.router = router
        super.init(coder: coder)
        setUpLayers()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMakerUseCase?.displayStock()
    }
}

extension JuiceMakerViewController {
    @IBAction private func didTapStrawberryBananaJuice(_ sender: UIButton) {
        juiceMakerUseCase?.produceJuice(flavor: .strawberryBanana)
    }
    
    @IBAction private func didTapMangoKiwiJuice(_ sender: UIButton) {
        juiceMakerUseCase?.produceJuice(flavor: .mangoKiwi)
    }
    
    @IBAction private func didTapStrawberryJuice(_ sender: UIButton) {
        juiceMakerUseCase?.produceJuice(flavor: .strawberry)
    }
    
    @IBAction private func didTapBananaJuice(_ sender: UIButton) {
        juiceMakerUseCase?.produceJuice(flavor: .banana)
    }
    
    @IBAction private func didTapPineappleJuice(_ sender: UIButton) {
        juiceMakerUseCase?.produceJuice(flavor: .pineapple)
    }
    
    @IBAction private func didTapKiwiJuice(_ sender: UIButton) {
        juiceMakerUseCase?.produceJuice(flavor: .kiwi)
    }
    
    @IBAction private func didTapMangoJuice(_ sender: UIButton) {
        juiceMakerUseCase?.produceJuice(flavor: .mango)
    }
    
    @IBAction private func didTapStockManager(_ sender: UIBarButtonItem) {
        self.router?.routeToNextViewController()
    }
}

extension JuiceMakerViewController {
    private func setUpLayers() {
        let juiceConverter = JuiceMakerResultConverter()
        self.juiceMakerUseCase?.resultConverter = juiceConverter
        juiceConverter.display = self
        
        self.router?.sourceViewController = self
    }
}

extension JuiceMakerViewController: StoryboardBased {
    static func instantiate(
        juiceMakerUseCase: JuiceMaker,
        router: JuiceMakerRouter
    ) -> Self {
        return sceneStoryboard.instantiateViewController(identifier: storyboardIdentifier) { coder in
            return Self.init(
                coder: coder,
                juiceMakerUseCase: juiceMakerUseCase,
                router: router
            )
        }
    }
}

extension JuiceMakerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        switch viewModel {
        case .success(let eachFruitCount):
            self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
            self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
            self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
            self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
            self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
        case .failure:
            return
        }
    }
}

extension JuiceMakerViewController: JuiceMakerResultDisplayable {
    func displayMakingResult(viewModel: JuiceMakerModel.ViewModel) {
        switch viewModel {
        case .sucess(let successInfo):
            successInfo.updatedStocks.forEach { (fruit, updatedCount) in
                updateStockLabel(of: fruit, with: updatedCount)
            }
            present(JuiceMakerAlert.juiceIsReady(juiceName: successInfo.juiceName).alertController, animated: true)
        case .failure:
            let action: AlertActionHandler = { [weak self] _ in
                self?.router?.routeToNextViewController()
            }
            present(JuiceMakerAlert.fruitShortage(editAction: action).alertController, animated: true)
        }
    }
    
    private func updateStockLabel(of fruit: Fruit, with updatedCount: Int) {
        switch fruit {
        case .strawberry: self.strawberryStockLabel.text = "\(updatedCount)"
        case .banana: self.bananaStockLabel.text = "\(updatedCount)"
        case .pineapple: self.pineappleStockLabel.text = "\(updatedCount)"
        case .kiwi: self.kiwiStockLabel.text = "\(updatedCount)"
        case .mango: self.mangoStockLabel.text = "\(updatedCount)"
        }
    }
}
