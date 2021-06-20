//
//  DogPhotoModuleBuilder.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

final class DogPhotoModuleBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        var presenter: DogPhotoPresenterInterface = DogPhotoPresenter()
        let networking: DogNetworkingInterface = DogNetworking()
        let interactor: DogPhotoInteractorInterface = DogPhotoInteractor(presenter: presenter, networking: networking)
        let viewController: DogPhotoViewController = DogPhotoViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
