//
//  AuthenticationPresenter.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

typealias ViewDelegate = AuthenticationViewControllerViewDelegate

final class AuthenticationPresenter: AuthenticationPresenterInterface {
    
    weak var viewDelegate: ViewDelegate?
    
    private(set) var TWAuthenticationService: AuthenticationService = TWAthenticationAdapter(authentication: TWAuthentication())
    private(set) var AppAuthenticationService: AuthenticationService = AppAuthenticationAdapter(authentication: AppAuthentication())
    
    func setupDelegate(_ delegate: ViewDelegate) {
        viewDelegate = delegate
    }
    
    func login(email: String, password: String, authenticationService: AuthenticationService) {
        authenticationService.login(email: email, password: password) { [weak self] user in
            self?.viewDelegate?.successLogin(user)
        }
    }
}

