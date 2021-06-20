//
//  AuthenticationPresenterInterface.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

protocol AuthenticationPresenterInterface: class {
    
    var TWAuthenticationService: AuthenticationService { get }
    var AppAuthenticationService: AuthenticationService { get }
    
    func setupDelegate(_ delegate: AuthenticationViewControllerViewDelegate)
    
    func login(email: String, password: String, authenticationService: AuthenticationService)
}

