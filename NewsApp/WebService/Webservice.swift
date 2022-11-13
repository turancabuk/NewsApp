//
//  Webservice.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//

import Foundation


protocol NewsWebServiceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: NewsAPICall, completion: @escaping (Result<T, Error>) -> Void)
}
final class NewsWebService: NewsWebServiceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: NewsAPICall, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = URLRequest(url: path.url)
        let task = URLSession.shared.dataTask(with: urlRequest) {data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

protocol MainWebServiceAdapterProtocol {
    func getNews(completion: @escaping (Result<Welcome, Error>) -> Void)
}

final class MainWebServiceAdapter: MainWebServiceAdapterProtocol {
    private let webService: NewsWebServiceProtocol
    
    init(webService: NewsWebServiceProtocol) {
        self.webService = webService
    }
    
    func getNews(completion: @escaping (Result<Welcome, Error>) -> Void) {
        webService.fetch(response: Welcome.self, with: .getNews, completion: completion)
    }
}



enum NetworkError: Error {
    case dataNotFound
}


