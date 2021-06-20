//
//  AuthenticationViewController + UI.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import UIKit

internal extension AuthenticationViewController {
    
    func makeTextField(placeholder: String, isSecureTextEntry: Bool) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecureTextEntry
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .quaternarySystemFill
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 16.0, weight: .medium)
        textField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        return textField
    }
    
    func makeLoginButton(with title: String, backgrounColor: UIColor) -> UIButton {
        let button = BounceButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = backgrounColor
        button.layer.cornerRadius = 12.0
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return button
    }
    
    func makeVerticalStackView(arrangedSubview: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubview)
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.distribution = .fillEqually
        return stackView
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Authentication 🔐"
    }
}
