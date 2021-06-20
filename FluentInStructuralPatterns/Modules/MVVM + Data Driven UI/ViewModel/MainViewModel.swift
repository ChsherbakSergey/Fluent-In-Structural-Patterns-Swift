//
//  AuthorizationViewModel.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import Foundation

protocol AuthorizationViewModelProtocol {
    
    var updateViewData: ((AuthorizationState) -> Void)? { get set }
    
    func fetch()
    func fetchWithError()
}

final class AuthorizationViewModel: AuthorizationViewModelProtocol {
    
    init() {
        updateViewData?(.initial)
    }
    
    internal var updateViewData: ((AuthorizationState) -> Void)?
    
    internal func fetch() {
        updateViewData?(.loading)
        
        //Simulate loading to be able to see loader for some time
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.updateViewData?(.success(AuthorizationState.Response(title: "Success")))
        }
    }
    
    internal func fetchWithError() {
        updateViewData?(.loading)
        
        //Simulate loading to be able to see loader for some time
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.updateViewData?(.failure(AuthorizationState.Response(title: "Error")))
        }
    }
}
