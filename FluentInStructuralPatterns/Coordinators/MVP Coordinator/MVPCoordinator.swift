//
//  MVPCoordinator.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import UIKit

final class MVPCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openNewsVC()
    }
    
    //MARK: - Push Methods
    private func openNewsVC() {
        let vc = NewsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
