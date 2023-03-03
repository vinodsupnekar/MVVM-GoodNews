//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation

class ArticleListViewModel {
    var articles: [NewsFeed] = []
    
    var feedBox:Box<[NewsFeed]> = Box([])
    
    init(_ articles: [NewsFeed] = []) {
        self.articles = articles
    }

    func loadArticles() {
        let url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0b43f608c9a422fafbffcd40814a4ac")!
//        feedLoading.value = "Loading..."

        let webservice = WebService(url: url, client: URLSessionHTTPClient(URLSession.shared))
        webservice.load { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case let .success(articles):
                self.feedBox.value =  articles
                
//               
            case let .failure(error):
                print(error)
            }
        }
    }
}

extension ArticleListViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count ?? 0
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
