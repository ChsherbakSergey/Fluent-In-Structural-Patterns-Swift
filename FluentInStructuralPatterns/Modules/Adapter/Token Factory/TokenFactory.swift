//
//  TokenFactory.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/20/21.
//

import Foundation

public final class TokenFactory {
    
    static func generateToken() ->  String {
        let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let numberOfLetters: Int = Int.random(in: 10...20)
        var token: String = ""
        
        for _ in 0..<numberOfLetters {
            token += String(letters.randomElement()!)
        }
        
        return token
    }
}

