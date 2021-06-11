//
//  CoordinatorConfigurator.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import UIKit

final class CoordinatorConfigurator {
    
    ///This method returns a coordinator based on which scheme is user
    static func setupInitialCoordinator() -> Coordinatable {
        
        let navigationController = UINavigationController()
        
        return MVVMCoordinator(navigationController: navigationController)
    }
}
