//
//  NewsViewControllerViewDelegate.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import Foundation

protocol NewsViewControllerViewDelegate: class {
    
    func displayPosts(_ posts: [Post])
    func displayError(_ error: NetworkingError)
}
