//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by Doyoung An on 12/11/23.
//

import UIKit

class InventoryViewController: UIViewController {
    
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
    
}

extension InventoryViewController: StoryboardIdentifiable { }
