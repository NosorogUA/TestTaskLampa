//
//  NetworkManager.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func loadDataFromAPI(category: String, page: Int, completion: @escaping ((Result<MovieRequestEntity, Error>) -> Void))
    func getImageURL(_ path: String) -> String
}

class NetworkManager: NetworkManagerProtocol {
    private let movieUrl = "https://api.themoviedb.org/3/movie"
    private let imageURL = "https://image.tmdb.org/t/p/w500"
    private let apiKey: String = "ed0957c3c3f2acb89d27b394e9612d5e"
    
    func getImageURL(_ path: String) -> String {
        let finalURL = "\(imageURL)\(path)"
        return finalURL
    }
    
    func loadDataFromAPI(category: String, page: Int, completion: @escaping ((Result<MovieRequestEntity, Error>) -> Void)) {
        
        let finalURL = "\(movieUrl)/\(category)?api_key=\(apiKey)&language=en-US&page=\(page)"
        
        guard let requestUrl = URL(string: finalURL) else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if response != nil { /*print(response)*/ }
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(MovieRequestEntity.self, from: data)
                // return Data
                completion(.success(json))
            } catch {
                //print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
