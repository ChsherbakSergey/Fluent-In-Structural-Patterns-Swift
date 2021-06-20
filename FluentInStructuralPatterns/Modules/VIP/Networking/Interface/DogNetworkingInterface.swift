//
//  DogNetworkingInterface.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

protocol DogNetworkingInterface {
    
    func fetchPhoto(with url: URL?, completion: @escaping (Result<DogAPIResponse, NetworkingError>) -> ())
    func downloadPhoto(with url: URL?, completion: @escaping(Result<UIImage, NetworkingError>) -> ())
}
