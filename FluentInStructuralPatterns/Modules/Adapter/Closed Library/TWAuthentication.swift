//
//  TWAuthentication.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

public final class TWAuthentication {
    
    public func signIn(email: String, password: String, completion: @escaping (TWUser) -> ()) {
        let token: String = TokenFactory.generateToken()
        let user: TWUser = TWUser(email: email, password: password, token: token)
        completion(user)
    }
}
