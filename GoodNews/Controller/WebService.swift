//
//  WebService.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation

public struct Root: Decodable {
    let articles: [NewsFeed]
}

class WebService : ArticlesLoader {
    
    private let url: URL
    private let client: HTTPClient

    private struct UnexpectedValueReprentation: Error {
    }
    
    public init(url:URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load(completion: @escaping (ArticlesFeedResult) -> Void) {
        
        self.client.getArticles(from: self.url) { result in
            switch result {
            case let .success(data, _):
                do {
                    let root =  try JSONDecoder().decode(Root.self, from: data)
                    completion(.success(root.articles))
                } catch {
                    completion(.failure(UnexpectedValueReprentation()))
                }
            case let .failure(error):
                completion(ArticlesFeedResult.failure(error))
            }
            
        }
    }
}


