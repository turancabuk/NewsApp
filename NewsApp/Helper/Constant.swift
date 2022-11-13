//
//  Constant.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//
//  https://newsapi.org/v2/top-headlines?country=tr&apiKey=08f919d29c534dff899bf1b83bbc2099

import Foundation

enum NewsAPICall: String {
    private var baseUrl: String {
        "https://newsapi.org/v2"
    }
    
    private var apiKey: String {
        "08f919d29c534dff899bf1b83bbc2099"
    }
    
    private var country: String {
        "tr"
    }
    
    case getNews
    
    private var urlString: String {
        switch self {
        case .getNews:
            return "\(baseUrl)/top-headlines?apiKey=\(apiKey)&country=\(country)"
        }
    }
    
    var url: URL {
        switch self {
        case .getNews:
            return URL(string: urlString)!
        }
    }
}
