//
//  DogPhotoPresenter.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

final class DogPhotoPresenter: DogPhotoPresenterInterface {
    
    weak var viewController: DogPhotoViewController?
    
    func showImage(image: UIImage) {
        viewController?.setDogPhotoImageView(with: image)
    }
    
    func showError(_ error: Error) {
        viewController?.showErrorAlert(with: error)
    }
}
