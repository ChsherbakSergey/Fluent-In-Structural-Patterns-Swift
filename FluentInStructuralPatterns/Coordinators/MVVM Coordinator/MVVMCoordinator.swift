//
//  MVVMCoordinator.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import UIKit

final class MVVMCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    //MARK: - Init(-s)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openAuthorizationVC()
    }
    
    //MARK: - Push Methods
    private func openAuthorizationVC() {
        let vc = AuthorizationViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
