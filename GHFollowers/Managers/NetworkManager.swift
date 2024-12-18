//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 3.10.2024.
//

import UIKit

enum GFError: Error {
    case invalidUrl
    case serverError
    case decodeError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseUrl = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode([Follower].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(.serverError))
            }
        }
        task.resume()
    }
    
    func getUser(username: String, completion: @escaping (Result<User?, GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)"
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.serverError))
            }
            
            guard let data = data else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        task.resume()
    }
}
