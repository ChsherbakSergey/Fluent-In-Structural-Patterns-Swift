//
//  TWAuthenticationAdapter.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

final class TWAthenticationAdapter: AuthenticationService {
    
    private let authentication: TWAuthentication
    
    init(authentication: TWAuthentication) {
        self.authentication = authentication
    }
    
    func login(email: String, password: String, completion: @escaping (User) -> ()) {
        authentication.signIn(email: email, password: password, completion: completion)
    }
}
