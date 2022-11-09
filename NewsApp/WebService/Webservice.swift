//
//  Webservice.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//

import Foundation
import Alamofire


public class Webservice {
    
    public static let shared = Webservice()
    
    enum APIError: Error {
        case error(_ errorString: String)
    }
    func getJSON<T: Decodable>(urlString: String, completion: @escaping (Result<T,APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid URL",comment: ""))))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.error("Error:\(error.localizedDescription)")))
                return
            }
            guard let data = data else {
                completion(.failure(.error(NSLocalizedString("Error: Data us corrupt", comment: ""))))
                return
            }
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
                return
            } catch let decodingError {
                completion(.failure(APIError.error("Error: \(decodingError.localizedDescription)")))
                return
            }
        }.resume()
        
    }
    
}























/*protocol NewsServiceProtocol {
 func getNews(newsId: String, completion: @escaping ([Welcome]?) ->Void)
 }
 class Webservice: NewsServiceProtocol {
 
 static let shared = Webservice()
 
 
 func getNews(newsId id: String, completion: @escaping ([Welcome]?) -> Void) {
 AF.request(NetworkConstant.NewsFromTurkey.getNews(id: id)).responseDecodable(of: Welcome.self) { data in
 guard let data = data.value else {
 completion(nil)
 return
 }
 completion()
 }
 }
 }*/

