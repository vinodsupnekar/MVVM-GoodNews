//
//  NewListTableViewController.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation
import UIKit

class NewListTableViewController:UITableViewController {
    
    var articlesViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0b43f608c9a422fafbffcd40814a4ac"
        WebService().getArticles(url: URL(string: url)!) { (result) in
            switch result {
            case let .success(articles):
                self.articlesViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    deinit {
        print("deinitialized")
    }
}

extension NewListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articlesViewModel == nil ? 0 : self.articlesViewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
          fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = articlesViewModel.articleAtIndex(indexPath.row)
        cell.configure(articleVM)
        
        return cell
    }
    
}
