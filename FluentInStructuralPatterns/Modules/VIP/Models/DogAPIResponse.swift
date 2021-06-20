//
//  DogAPIResponse.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import Foundation

struct DogAPIResponse: Decodable {
    let message: String
    let status: String
    
    private enum CodingKeys: String, CodingKey {
        
        case message
        
        case status
    }
}

extension DogAPIResponse {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        try self.init(message: container.decode(String.self, forKey: .message),
                      status: container.decode(String.self, forKey: .status))
    }
}
