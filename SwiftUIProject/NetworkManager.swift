//
//  NetworkManager.swift
//  SwiftUIProject
//
//  Created by Vishal  on 19/02/25.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    // shared instance
    static var shared = NetworkManager()
    
    func fetchRoverPhotos(completion: @escaping (Result<RoverPhoto, Error>) -> Void) {
        let apiKey = "UJiC6fK8Rl3bBdhlEYTAsGCeIGl3UBTcmgEbytHR"
        let urlString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(RoverPhoto.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
