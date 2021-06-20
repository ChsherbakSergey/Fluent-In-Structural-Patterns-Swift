//
//  AuthenticationViewControllerViewDelegate.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

protocol AuthenticationViewControllerViewDelegate: class {
    
    func successLogin(_ user: User)
}
