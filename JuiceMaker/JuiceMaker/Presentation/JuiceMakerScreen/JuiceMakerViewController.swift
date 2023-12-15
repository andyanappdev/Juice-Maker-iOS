//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class JuiceMakerViewController: UIViewController {
    
    private var viewModel: JuiceMakerViewModel
    
    init(viewModel: JuiceMakerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func configure(with viewModel: JuiceMakerViewModel) {
        self.viewModel = viewModel
    }
    
    func injectDependencies() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Could not get AppDelegate")
        }
        
        viewModel = appDelegate.dependencyInjection.injectDependencies()
        configure(with: viewModel)
    }
    
    
}

extension JuiceMakerViewController: StoryboardIdentifiable { }

