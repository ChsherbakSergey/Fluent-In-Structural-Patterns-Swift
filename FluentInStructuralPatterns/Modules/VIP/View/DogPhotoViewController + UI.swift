//
//  DogPhotoViewController + UI.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

internal extension DogPhotoViewController {
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .quaternarySystemFill
        imageView.layer.cornerRadius = 25.0
        imageView.widthAnchor.constraint(equalToConstant: 240.0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 240.0).isActive = true
        return imageView
    }
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }
    
    func setNavigationBar() {
        navigationItem.title = "Dog 🦮"
    }
}
