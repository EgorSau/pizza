//
//  NetworkService.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import Foundation

#warning("!!!")
let stringUrl = "https://aws.random.cat/meow"

protocol NetworkRouter: AnyObject {
    func request(for url: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class NetworkService {}

extension NetworkService: NetworkRouter {
    
    func request(for url: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.custom(description: "Wrong url string.")))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(.custom(description: error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.custom(description: "Empty data.")))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
