//
//  JuiceMakerViewModel.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

import UIKit

final class JuiceMakerViewModel {
    // MARK: - Properties & Initializer
    private weak var rootNavigationController: UINavigationController?
    private var fruitStoreUseCase: FruitStoreUseCase
    private var juiceMakerUseCase: JuiceMakerUseCase
    private var state: InventoryState = InventoryState()
    
    init(fruitStoreUseCase: FruitStoreUseCase, juiceMakerUseCase: JuiceMakerUseCase) {
        self.fruitStoreUseCase = fruitStoreUseCase
        self.juiceMakerUseCase = juiceMakerUseCase
        fetchInventoryState()
    }
    
    
    // MARK: - Methods
    
    private func fetchInventoryState() {
        let strawberryQuantity = fruitStoreUseCase.getFruit(type: .strawberry).quantity
        let bananaQuantity = fruitStoreUseCase.getFruit(type: .banana).quantity
        let pineappleQuantity = fruitStoreUseCase.getFruit(type: .pineapple).quantity
        let kiwiQuantity = fruitStoreUseCase.getFruit(type: .kiwi).quantity
        let mangoQuantity = fruitStoreUseCase.getFruit(type: .mango).quantity
        
        state = state.copyWith(
            strawberryQuantity: strawberryQuantity,
            bananaQuantity: bananaQuantity,
            pineappleQuantity: pineappleQuantity,
            kiwiQuantity: kiwiQuantity,
            mangoQuantity: mangoQuantity
        )
    }
    
    func makeStrawberryJuice() {
        let reuslt = juiceMakerUseCase.makeStrawberryJuice()
        
        switch reuslt {
        case Result.success:
            showSucessAlert(message: "Strawberry 쥬스 나왔습니다! 맛있게 드세요!")
        case Result.failure(let error):
            showErrorAlert(message: error.localizedDescription)
        }
    }
    
    func makeBananaJuice() {
        let result = juiceMakerUseCase.makeBananaJuice()
        
        switch result {
        case Result.success:
            showErrorAlert(message: "BananaJuice 쥬스 나왔습니다! 맛있게 드세요!")
        case Result.failure(let error):
            showErrorAlert(message: error.localizedDescription)
        }
        
    }
    
    func makeKiwiJuice() {
        let result = juiceMakerUseCase.makeKiwiJuice()
        
        switch result {
        case Result.success:
            showErrorAlert(message: "KiwiJuice 쥬스 나왔습니다! 맛있게 드세요!")
        case Result.failure(let error):
            showErrorAlert(message: error.localizedDescription)
        }
    }
    
    func makePineappleJuice() {
        let result = juiceMakerUseCase.makePineappleJuice()
        
        switch result {
        case Result.success:
            showErrorAlert(message: "PineappleJuice 쥬스 나왔습니다! 맛있게 드세요!")
        case Result.failure(let error):
            showErrorAlert(message: error.localizedDescription)
        }
    }
    
    func makeStrawberryBananaJuice() {
        let result = juiceMakerUseCase.makeStrawberryBananaJuice()
        
        switch result {
        case Result.success:
            showErrorAlert(message: "StrawberryBananaJuice 쥬스 나왔습니다! 맛있게 드세요!")
        case Result.failure(let error):
            showErrorAlert(message: error.localizedDescription)
        }
    }
    
    func makeMangoJuice() {
        let result = juiceMakerUseCase.makeMangoJuice()
        
        switch result {
        case Result.success:
            showErrorAlert(message: "MangoJuice 쥬스 나왔습니다! 맛있게 드세요!")
        case Result.failure(let error):
            showErrorAlert(message: error.localizedDescription)
        }
    }
    
    func makeMangoKiwiJuice() {
        let result = juiceMakerUseCase.makeMangoKiwiJuice()
        
        switch result {
        case Result.success:
            showErrorAlert(message: "MangoKiwiJuice 쥬스 나왔습니다! 맛있게 드세요!")
        case Result.failure(let error):
            showErrorAlert(message: error.localizedDescription)
        }
    }
    
    
    private func showSucessAlert(message: String) {
        let alert = UIAlertController(title: "제조 성공", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAnction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAnction)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let currentWindow = windowScene.windows.first,
           let rootViewController = currentWindow.rootViewController {
            rootViewController.present(alert, animated: true, completion: nil)
        }
        
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "제조 실패", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction =  UIAlertAction(title: "예", style: UIAlertAction.Style.default) { _ in self.moveToInventoryScreen()
        }
        
        let noAciton = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(noAciton)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let currentWindow = windowScene.windows.first,
           let rootViewController = currentWindow.rootViewController {
            rootViewController.present(alert, animated: true, completion: nil)
        }
    }
    
    private func moveToInventoryScreen() {
        // TODO: navigationController를 사용하여 새로운 화면으로 이동
        let inventoryVC = InventoryViewController()
        self.rootNavigationController?.navigationController?.pushViewController(inventoryVC, animated: true)
    }
    
    func updateInventory(type: FruitType, quantity: Int) {
        let result = fruitStoreUseCase.updateFruit(type: type, quantity: quantity)
        
        switch result {
        case Result.success(let value):
            // TODO: 성공 결과 처리
            print(value)
        case Result.failure(let error):
            // TODO: 실패 결과 처리
            print(error.localizedDescription)
        }
    }
}
