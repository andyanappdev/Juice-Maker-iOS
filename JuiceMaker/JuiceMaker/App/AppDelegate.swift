//
//  JuiceMaker - AppDelegate.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var dependencyInjection: DependencyInjection!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        dependencyInjection = DependencyInjection()
        let juiceMakerViewController = dependencyInjection.getJuiceMakerViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: dependencyInjection.getJuiceMakerViewController())
        window?.makeKeyAndVisible()
        
        if let juiceMakerViewController = window?.rootViewController as? JuiceMakerViewController {
            juiceMakerViewController.injectDependencies()
        }
        
        return true
    }
}
