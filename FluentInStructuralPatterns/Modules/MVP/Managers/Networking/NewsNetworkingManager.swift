//
//  NewsNetworkingManager.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/12/21.
//

import Foundation

struct NewsNetworkingManager: NewsNetworkingManagerInterface {
    
    private let session = URLSession(configuration: .default)
    
    func getPosts(with url: URL?, completion: @escaping (Result<[Post], NetworkingError>) -> Void) {
        guard let url = url else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.failedToFetch))
                }
                return
            }
            
            let decoder = JSONDecoder()
            
            switch response.statusCode {
            
            case 200:
                do {
                    let posts = try decoder.decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(posts))
                    }
                } catch let decodeError as NSError {
                    DispatchQueue.main.async {
                        completion(.failure(.failedToFetch))
                    }
                    print("Decode Error is: \(decodeError.localizedDescription)")
                }
                
            default:
                DispatchQueue.main.async {
                    completion(.failure(.invalidURL))
                }
            }
        }
        task.resume()
    }
}
