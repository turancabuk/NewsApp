//
//  MainViewModel.swift
//  NewsApp
//
//  Created by Turan Çabuk on 9.11.2022.
//

import Foundation


final class MainViewModel {
    private let webService: MainWebServiceAdapter
    
    init(webService: MainWebServiceAdapter) {
        self.webService = webService
    }
    
    func getNews() {
        webService.getNews { result in
            switch result {
            case .success(let response):
                print("article", response.articles?.first)
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}


