//
//  AuthorizationView + UIElements.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import UIKit

extension AuthorizationView {
    
    func makeSignInButton() -> UIButton {
        let button = BounceButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont.rounded(.systemFont(ofSize: 16.0, weight: .medium))()
        button.tintColor = .black
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.layer.cornerRadius = 10.0
        return button
    }
    
    func makeSignInWithErrorButton() -> UIButton {
        let button = BounceButton(type: .system)
        button.setTitle("Sign in with error", for: .normal)
        button.titleLabel?.font = UIFont.rounded(.systemFont(ofSize: 16.0, weight: .medium))()
        button.tintColor = .white
        button.backgroundColor = .systemRed
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.layer.cornerRadius = 10.0
        return button
    }
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        return activityIndicatorView
    }
    
    func makeResultLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.rounded(.systemFont(ofSize: 24.0, weight: .semibold))()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    
}
