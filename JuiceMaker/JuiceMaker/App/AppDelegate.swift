//
//  JuiceMaker - AppDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        
        let fruitStore = FruitStore(initialCount: 10)
        let juiceCoordinator = JuiceMakerCoordinator(
            navigationController: navigationController,
            fruitStore: fruitStore
        )
        juiceCoordinator.start()
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
