//
//  AppAuthentication.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

final class AppAuthentication {
    
    func login(email: String, password: String, completion: @escaping (AppUser) -> ()) {
        let token: String = TokenFactory.generateToken()
        let user: AppUser = AppUser(email: email, password: password, token: token)
        completion(user)
    }
}
