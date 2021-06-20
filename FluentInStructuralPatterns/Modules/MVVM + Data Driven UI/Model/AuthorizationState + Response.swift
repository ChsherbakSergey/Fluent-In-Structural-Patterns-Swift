//
//  ViewData.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/11/21.
//

import Foundation

enum AuthorizationState {
    
    case initial
    
    case loading
    
    case success(Response)
    
    case failure(Response)
    
    struct Response {
        let title: String
    }
    
}
