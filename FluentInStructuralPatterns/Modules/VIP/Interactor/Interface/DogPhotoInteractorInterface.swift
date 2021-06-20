//
//  DogPhotoInteractorInterface.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import Foundation

protocol DogPhotoInteractorInterface {
    
    init(presenter: DogPhotoPresenterInterface, networking: DogNetworkingInterface)
    
    func fetchPhoto()
}
