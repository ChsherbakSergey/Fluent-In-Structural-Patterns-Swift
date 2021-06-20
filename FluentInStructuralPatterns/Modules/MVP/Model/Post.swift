//
//  Post.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey Chsherbak on 6/12/21.
//

import Foundation

struct Post: Codable {
    
    let userId: Int
    let postId: Int
    let title: String
    let text: String
    
    private enum CodingKeys: String, CodingKey {
        
        case userId, title
        
        case postId = "id"
        
        case text = "body"
    }
}

extension Post {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        try self.init(userId: container.decode(Int.self, forKey: .userId),
                      postId: container.decode(Int.self, forKey: .postId),
                      title: container.decode(String.self, forKey: .title),
                      text: container.decode(String.self, forKey: .text))
    }
}

