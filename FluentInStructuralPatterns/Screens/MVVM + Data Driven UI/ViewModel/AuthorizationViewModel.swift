//
//  AuthorizationViewModel.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import Foundation

protocol AuthorizationViewModelProtocol {
    
    var updateAuthorizationView: ((AuthorizationState) -> Void)? { get set }
    
    func signIn()
    func signInWithError()
}

final class AuthorizationViewModel: AuthorizationViewModelProtocol {
    
    init() {
        updateAuthorizationView?(.initial)
    }
    
    internal var updateAuthorizationView: ((AuthorizationState) -> Void)?
    
    internal func signIn() {
        updateAuthorizationView?(.loading)
        
        //Simulate loading to be able to see loader for some time
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.updateAuthorizationView?(.success(AuthorizationState.Response(title: "Twiiter: @SChsherbak")))
        }
    }
    
    internal func signInWithError() {
        updateAuthorizationView?(.loading)
        
        //Simulate loading to be able to see loader for some time
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.updateAuthorizationView?(.failure(AuthorizationState.Response(title: "Error")))
        }
    }
}
