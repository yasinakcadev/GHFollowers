//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 3.10.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping ([Followers]?, String?) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=10&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, "Invalid url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(nil, "Server error")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode([Followers].self, from: data)
                completion(results, nil)
            } catch {
                completion(nil, "Decode error")
            }
        }
        task.resume()
    }
}
