//
//  AdapterCoordinator.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

final class AdapterCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openAuthenticationVC()
    }
    
    //MARK: - Push Methods
    private func openAuthenticationVC() {
        let vc = AuthenticationViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
