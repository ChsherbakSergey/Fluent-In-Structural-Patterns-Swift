//
//  NewsPresenterInterface.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import Foundation

protocol NewsPresenterInterface {
    
    var posts: [Post] { get set }
    
    func setupDelegate(delegate: NewsViewControllerViewDelegate)
    func fetchPosts(with url: URL?)
}
