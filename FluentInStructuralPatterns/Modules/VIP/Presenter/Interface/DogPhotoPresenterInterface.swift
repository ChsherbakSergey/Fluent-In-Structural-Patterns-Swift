//
//  DogPhotoPresenterInterface.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

protocol DogPhotoPresenterInterface {
    
    var viewController: DogPhotoViewController? { get set }
    
    func showImage(image: UIImage)
    
    func showError(_ error: Error)
}
