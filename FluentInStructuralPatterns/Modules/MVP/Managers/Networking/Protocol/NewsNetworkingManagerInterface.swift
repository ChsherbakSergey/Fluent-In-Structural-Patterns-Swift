//
//  NewsNetworkingManagerInterface.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import Foundation

protocol NewsNetworkingManagerInterface {
    
    func getPosts(with url: URL?, completion: @escaping (Result<[Post], NetworkingError>) -> Void)
}
