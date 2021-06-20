//
//  DogNetworking.swift
//  FluentInStructuralPatterns
//
//  Created by Sergey on 6/20/21.
//

import UIKit

struct DogNetworking: DogNetworkingInterface {
    
    private let session: URLSession = URLSession(configuration: .default)
    
    func fetchPhoto(with url: URL?, completion: @escaping (Result<DogAPIResponse, NetworkingError>) -> ())  {
        guard let url = url else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.failedToFetch))
                }
                return }
            
            switch response.statusCode {
            
            case 200:
                do {
                    let response = try JSONDecoder().decode(DogAPIResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } catch let decodeError as NSError {
                    DispatchQueue.main.async {
                        completion(.failure(.failedToFetch))
                    }
                    print("Decode Error is: \(decodeError)")
                }
                
                
            default:
                break
            }
        }
        task.resume()
    }
    
    func downloadPhoto(with url: URL?, completion: @escaping (Result<UIImage, NetworkingError>) -> ()) {
        guard let url = url else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.failedToFetch))
                }
                return }
            
            switch response.statusCode {
            
            case 200:
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    completion(.success(image))
                }
                
            default:
                break
            }
        }
        task.resume()
    }
}
