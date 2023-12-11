//
//  Result.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

import Foundation

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

extension Result {
    var value: Success? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    var error: Failure? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

enum FruitStoreError: Error {
    case fruitNotFound
    case invalidQuantity
}

enum JuiceMakerError: Error {
    case insufficientFruit
}

extension FruitStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .fruitNotFound:
            return NSLocalizedString("Fruit not found", comment: "해당 과일을 찾을수 없습니다!")
        case .invalidQuantity:
            return NSLocalizedString("Invalid quantity", comment: "유효하지 않은 수량입니다!")
        }
    }
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .insufficientFruit:
            return NSLocalizedString("Insufficient fruit", comment: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
}
