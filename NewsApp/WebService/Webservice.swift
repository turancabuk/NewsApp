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




/*public class BaseResult<T: Decodable> : Decodable {
    init(){}
}
class Webservice {
    static let shared = Webservice()
    enum APIError: Error {
        case error(_ errorString: String)
    }
    public func request<T: Decodable> (url: String, parameters: [String : Any] = [:], method: String = "GET", httpHeaders: String? = nil, success: @escaping (T) -> Void, failure: @escaping () -> () ) {
        let newUrl = self.encodeUrl(url)
        let postData = NSData(data: "".data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: newUrl )! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 30.0)
        request.httpMethod = method
        request.httpBody = postData as Data
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil || data == nil {
                print(error)
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data! )
                success(object)
            } catch {
                failure()
            }
        })
        dataTask.resume()
    }
    
    func encodeUrl(_ url : String) -> String {
        return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 */
