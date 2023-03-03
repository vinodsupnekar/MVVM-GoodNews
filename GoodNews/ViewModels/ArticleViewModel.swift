//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation

struct ArticleListViewModel {
    let articles: [NewsFeed]
}

extension ArticleListViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        return ArticleViewModel(self.articles[index])
    }
}

struct ArticleViewModel {
    private let article: NewsFeed
}

extension ArticleViewModel {
    init(_ newsFeed: NewsFeed) {
        self.article = newsFeed
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}
