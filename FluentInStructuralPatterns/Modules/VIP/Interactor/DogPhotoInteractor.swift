//
//  DogPhotoInteractor.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import Foundation

final class DogPhotoInteractor: DogPhotoInteractorInterface {
    
    private let presenter: DogPhotoPresenterInterface
    private let networking: DogNetworkingInterface
    
    init(presenter: DogPhotoPresenterInterface, networking: DogNetworkingInterface) {
        self.presenter = presenter
        self.networking = networking
    }
    
    func fetchPhoto() {
        networking.fetchPhoto(with: URLConstants.dogPhotoURL) { [weak self] result in
            switch result {
            
            case .success(let response):
                guard let url = URL(string: response.message) else { return }
                
                self?.networking.downloadPhoto(with: url) { [weak self] result in
                    switch result {

                    case .success(let image):
                        self?.presenter.showImage(image: image)

                    case .failure(let error):
                        self?.presenter.showError(error)
                    }
                }
                
            case .failure(let error):
                self?.presenter.showError(error)
            }
        }
    }
}
