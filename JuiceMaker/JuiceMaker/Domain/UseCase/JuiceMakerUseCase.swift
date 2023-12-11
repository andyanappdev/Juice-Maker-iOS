//
//  JuiceMakerUseCase.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

struct JuiceMakerUseCase {
    // MARK: - Properties & Initializer
    private let repository: JuiceMakerRepository
    
    init(repository: JuiceMakerRepository) {
        self.repository = repository
    }
    
    
    // MARK: - Methods
    func makeStrawberryJuice() -> Result<Void, JuiceMakerError> {
        do {
            try repository.makeStrawberryJuice()
            return Result.success(())
        } catch let error as JuiceMakerError {
            return Result.failure(error)
        } catch {
            return Result.failure(JuiceMakerError.insufficientFruit)
        }
    }
    
    func makeBananaJuice() -> Result<Void, Error> {
        do {
            try repository.makeBananaJuice()
            return Result.success(())
        } catch let error as JuiceMakerError {
            return Result.failure(error)
        } catch {
            return Result.failure(JuiceMakerError.insufficientFruit)
        }
    }
    
    func makeKiwiJuice() -> Result<Void, Error> {
        do {
            try repository.makeKiwiJuice()
            return Result.success(())
        } catch let error as JuiceMakerError {
            return Result.failure(error)
        } catch {
            return Result.failure(JuiceMakerError.insufficientFruit)
        }
    }
    
    func makePineappleJuice() -> Result<Void, Error> {
        do {
            try repository.makePineappleJuice()
            return Result.success(())
        } catch let error as JuiceMakerError {
            return Result.failure(error)
        } catch {
            return Result.failure(JuiceMakerError.insufficientFruit)
        }
    }
    
    func makeStrawberryBananaJuice() -> Result<Void, Error> {
        do {
            try repository.makeStrawberryBananaJuice()
            return Result.success(())
        } catch let error as JuiceMakerError {
            return Result.failure(error)
        } catch {
            return Result.failure(JuiceMakerError.insufficientFruit)
        }
    }
    
    func makeMangoJuice() -> Result<Void, Error> {
        do {
            try repository.makeMangoJuice()
            return Result.success(())
        } catch let error as JuiceMakerError {
            return Result.failure(error)
        } catch {
            return Result.failure(JuiceMakerError.insufficientFruit)
        }
    }
    
    func makeMangoKiwiJuice() -> Result<Void, Error> {
        do {
            try repository.makeMangoKiwiJuice()
            return Result.success(())
        } catch let error as JuiceMakerError {
            return Result.failure(error)
        } catch {
            return Result.failure(JuiceMakerError.insufficientFruit)
        }
    }
}
