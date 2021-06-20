//
//  NewsPresenter.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import Foundation

final class NewsPresenter: NewsPresenterInterface {
        
    weak var viewDelegate: NewsViewControllerViewDelegate?
    
    private let networking: NewsNetworkingManagerInterface = NewsNetworkingManager()
    var posts: [Post] = []
    
    func setupDelegate(delegate: NewsViewControllerViewDelegate) {
        viewDelegate = delegate
    }
    
    func fetchPosts(with url: URL?) {
        networking.getPosts(with: url) { [weak self] (result) in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.viewDelegate?.displayPosts(posts)
                
            case .failure(let error):
                self?.viewDelegate?.displayError(error)
                print("Error is: \(error.localizedDescription)")
            }
        }
    }
}
