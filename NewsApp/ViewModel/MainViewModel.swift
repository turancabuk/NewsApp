//
//  MainViewModel.swift
//  NewsApp
//
//  Created by Turan Çabuk on 9.11.2022.
//

import Foundation


final class MainViewModel {
    private let webService: MainWebServiceAdapter
    
    var articleList = [Article]()
    
    init(webService: MainWebServiceAdapter, articleList: [Article] = [Article]()){
        self.webService = webService
    }
    
    func getNews(complrtionHandler: @escaping () -> Void) {
        webService.getNews { result in
            switch result {
            case .success(let response):
                if let articles = response.articles {
                    self.articleList = articles
                }
                complrtionHandler()
            case .failure(let error):
                print(error)
                break
                
            }
        }
    }
}


