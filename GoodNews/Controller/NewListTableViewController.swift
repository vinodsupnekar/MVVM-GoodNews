//
//  NewListTableViewController.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation
import UIKit


class NewListTableViewController:UITableViewController {
    
    let viewModel = ArticleListViewModel([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.feedBox?.bind { [weak self] (articles) in
            guard let self = self else {return}
            self.viewModel.articles = articles
                           DispatchQueue.main.async {
                               self.tableView.reloadData()
                           }
        }
        
        viewModel.loadArticles()
    }
    
    deinit {
        print("deinitialized")
    }
}

extension NewListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  self.viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
          fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = viewModel.articleAtIndex(indexPath.row)
        cell.configure(articleVM)
        
        return cell
    }
    
}


final class Box<T> {
    
    typealias Listner = (T) -> Void
    var listener: Listner?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listner?) {
        self.listener = listener
        listener?(value)
    }
    
}
