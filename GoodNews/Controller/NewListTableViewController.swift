//
//  NewListTableViewController.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation
import UIKit

class NewListTableViewController:UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0b43f608c9a422fafbffcd40814a4ac"
        
    
        WebService().getArticles(url: URL(string: url)!) { (result) in
            print("result ==> \(result)")
        }
    }
    
    deinit {
        print("deinitialized")
    }
}
