//
//  AppAuthenticationAdapter.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

final class AppAuthenticationAdapter: AuthenticationService {
    
    private let authentication: AppAuthentication
    
    init(authentication: AppAuthentication) {
        self.authentication = authentication
    }
    
    func login(email: String, password: String, completion: @escaping (User) -> ()) {
        authentication.login(email: email, password: password, completion: completion)
    }
}
