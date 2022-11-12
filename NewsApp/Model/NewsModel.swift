//
//  NewsModel.swift
//  NewsApp
//
//  Created by Turan Çabuk on 8.11.2022.
//

import Foundation
import UIKit

// MARK: - Welcome
struct Welcome: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        self.articles = try container.decodeIfPresent([Article].self, forKey: .articles)
    }
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription
        case url, urlToImage, publishedAt, content
        
        
    }
}






// MARK: - Source
struct Source: Codable {
    let id: JSONNull?
    let name: String?
}

// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    public var hashValue: Int {
        return 0
    }
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

