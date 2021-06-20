//
//  AuthenticationService.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import Foundation

protocol AuthenticationService {
    
    func login(email: String, password: String, completion: @escaping (User) -> ())
}
