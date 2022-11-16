//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Turan Çabuk on 15.11.2022.

import Foundation
import UIKit

final class DetailViewModel {
    private let webservice: MainWebServiceAdapter
    
    var articleList = [Article]()
    
    init(webservice: MainWebServiceAdapter, articleList: [Article] = [Article]()) {
        self.webservice = webservice
    }
    
    func getNewsDetail(completionHandler: @escaping () -> Void) {
        webservice.getNews{ result in
            switch result {
            case .success(let response):
                if let articles = response.articles{
                    self.articleList = articles
                }
                completionHandler()
            case .failure(let error):
                print(error)
            }
        }
    }
}
