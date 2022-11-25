//
//  Mapper.swift
//  FoodStore
//
//  Created by Саидов Тимур on 25.11.2022.
//

import Foundation

protocol MapperProtocol {
    func parse<T: Decodable>(_ type: T.Type,
                             from data: Data,
                             completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class Mapper {}

extension Mapper: MapperProtocol {
    
    func parse<T: Decodable>(_ type: T.Type,
                             from data: Data,
                             completion: @escaping (Result<T, NetworkError>) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(type, from: data)
            completion(.success(decodedData))
        } catch let error {
            completion(.failure(.parse(reason: error.localizedDescription)))
        }
    }
}
