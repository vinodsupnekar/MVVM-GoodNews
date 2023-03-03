//
//  ArticleLoader.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation

public struct NewsFeed: Decodable {
    let description: String?
    let title: String
    
}

public enum ArticlesFeedResult {
    case success([NewsFeed])
    case failure(Error)
}

protocol ArticlesLoader {
    func load(completion: @escaping(ArticlesFeedResult) -> Void)
}
