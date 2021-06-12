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
        
        #if MVVM
        return MVVMCoordinator(navigationController: navigationController)
        #elseif MVP
        return MVPCoordinator(navigationController: navigationController)
        #else
        return MVVMCoordinator(navigationController: navigationController)
        #endif
    }
}
