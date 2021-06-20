//
//  VIPCoordinator.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

final class VIPCoordinator: Coordinatable {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openDogPhotoVC()
    }
    
    //MARK: - Push Methods
    private func openDogPhotoVC() {
        guard let vc = DogPhotoModuleBuilder().build() as? DogPhotoViewController else { return }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
