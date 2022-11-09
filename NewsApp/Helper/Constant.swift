//
//  Constant.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//
//  APIKEY:     08f919d29c534dff899bf1b83bbc2099
//  URL:        https://newsapi.org/v2/top-headlines?country=tr

import Foundation

class NetworkConstant {
    
    enum NewsFromTurkey: String {
        
        
        case baseUrl = "https://newsapi.org/v2/top-headlines?country=tr"
        case apiKey = "08f919d29c534dff899bf1b83bbc2099"
        
        
        static func getNews(id: String) -> String{
            
             "\(baseUrl.rawValue)&\(apiKey.rawValue)"
           
        }
    }
}
