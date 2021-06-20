//
//  User.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

protocol User {
    var email: String { get set }
    var password: String { get set }
    var token: String { get set }
}
